class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  #Si params[:locale] es null es posara el default (cat definit en config/application.rb)
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
