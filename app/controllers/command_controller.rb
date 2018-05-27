class CommandController < ApplicationController
  before_action :check_user, :except => [:createpayment, :executepayment]
  before_action :set_paypaltoken, :only => [:createpayment, :executepayment]
  before_action :get_current_commnand, :only => [:createpayment]
  @current_command
  def add_to_cart
    @product = Product.find(params[:id])
    user_commands = current_user.commands
    if user_commands.empty?
      self.create_cart
    else
      @current_command = user_commands.find_by(state: 'current')
      @message = @current_command.price
    end
    @line_command = LineCommand.create(product_id: @product.id ,quantity: 1, price: @product.price)
    @current_command.line_commands << @line_command
    price = @current_command.price + @product.price
    @current_command.update(price: price)

  end

  def create_cart
    @current_command = Command.create(state: 'current')
    @current_command.update(price: 0.0)
    current_user.commands << @current_command
  end

  def cart
    @current_command = current_user.commands.find_by(state: 'current')
    render 'add_to_cart'
  end

  def remove_item
    @current_command = current_user.commands.find_by(state: 'current')
    price = @current_command.price - @current_command.line_commands.find(params[:id]).price
    @current_command.line_commands.find(params[:id]).destroy
    @current_command.update(price: price)
    render 'add_to_cart'
  end


  def set_paypaltoken
      @paypaltoken = 'A21AAEH98LinFnJ9NyGgrFyvDrOPci7Vb3-LwUZ6T_vfTht3U9FCaJhzYAeVIo032R9811loCijtHFJrZyzAqj5mazgw4s0NQ'
  end

  def createpayment
    @response =
        HTTParty.post('https://api.sandbox.paypal.com/v1/payments/payment',
                      :headers => { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@paypaltoken}"},
                      :body =>  {   :intent => 'sale', :redirect_urls => {'return_url' => 'https://example.com','cancel_url' => 'https://example.com'},
                                    :payer => {'payment_method' => 'paypal'}, :transactions => [{'amount' => {'total' => @current_command.price, 'currency' => 'EUR'}}]
                      }.to_json, :debug_output => Rails.logger)
        render json: {
              paymentID: "#{@response["id"]}"
        }.to_json
  end

  def executepayment
    @response = HTTParty.post("https://api.sandbox.paypal.com/v1/payments/payment/#{params[:paymentID]}/execute/",
                      :headers => { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@paypaltoken}"},
                      :body =>  {   :payer_id => "#{params[:payerID]}"}.to_json, :debug_output => Rails.logger)
  end

  def payment_completed
    @current_command = current_user.commands.find_by(state: 'current')
    @current_command.update(state: 'paid')
    render 'user_panel/command_details'
  end

  private
  def check_user
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
  def get_current_commnand
     @current_command = Command.find(params[:id])
  end
end
