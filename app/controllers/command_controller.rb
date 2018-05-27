class CommandController < ApplicationController

  before_action :check_user, :except => [:createpayment, :executepayment]
  before_action :set_paypaltoken, :only => [:createpayment, :executepayment]
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

  def set_paypaltoken
    @paypaltoken = 'A21AAEutydnjSBAqMTYzVTwPpOkcRhLGAmcfvc_-om3nkSwe8fCnO_mTWhYrqM5myWi6JQ0xPM6PvZfcvTuwoyD9vxth5fO8Q'
  end

  def createpayment
    @response =
        HTTParty.post('https://api.sandbox.paypal.com/v1/payments/payment',
                      :headers => { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@paypaltoken}"},
                      :body =>  {   :intent => 'sale', :redirect_urls => {'return_url' => 'https://example.com','cancel_url' => 'https://example.com'},
                                    :payer => {'payment_method' => 'paypal'}, :transactions => [{'amount' => {'total' => '3.00', 'currency' => 'EUR'}}]
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

  private
  def check_user
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
