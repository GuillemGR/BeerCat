class WelcomeController < ApplicationController
  def index
    @products = Product.find(["1", "2", "3", "4", "5", "6"])
  end
end
