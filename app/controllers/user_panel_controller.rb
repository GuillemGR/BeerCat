class UserPanelController < ApplicationController



  def index
    @user_commands = current_user.commands
  end
  def command_details
    @current_command = current_user.commands.find(params[:id])
  end
end
