class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_num_commands
  #Si params[:locale] es null es posara el default (cat definit en config/application.rb)
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_num_commands
    if user_signed_in?
      @num_commands = 0
      commands = current_user.commands
      command = commands.find_by(state: 'current')
      unless command.nil?
        @num_commands = command.line_commands.length
      end
    end

  end
end
