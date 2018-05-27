class AdminPanelController < ApplicationController

  before_action :check_is_admin

  def index
    @cathegories = Cathegory.all
    @products = Product.all
  end

  private
  def check_is_admin
    unless admin_signed_in?
      redirect_to '/welcome'
    end
  end
end
