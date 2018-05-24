class CommandController < ApplicationController

  before_action :check_user
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

  def pay_cart

  end

  private
  def check_user
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
