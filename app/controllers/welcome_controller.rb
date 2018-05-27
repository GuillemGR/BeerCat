class WelcomeController < ApplicationController
  def index
    @products = Product.find(["1", "2", "3", "4", "5", "6"])
    @active_products = Product.find(["7", "8", "9"])
  end
end
