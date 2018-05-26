class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale
  before_action :set_num_commands

  before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :surname])
   # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
  end
  #Si params[:locale] es null es posara el default (cat definit en config/application.rb)
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_num_commands
    if user_signed_in?
      @num_commands = 0
      commands = current_user.commands
      @user_name = current_user.name
      command = commands.find_by(state: 'current')
      unless command.nil?
        @num_commands = command.line_commands.length
      end
    end

  end
end
