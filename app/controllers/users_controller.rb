class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def show
    display_name = params[:display_name]

    if display_name
      @user = User.find_by(id: current_user.id)
      @tracks = Track.where(user_id: @user.id)
    end
  end

  private

  def correct_user
    if params[:display_name] != current_user.display_name
      redirect_to discover_path, flash: { notice: 'You are not authorized!' }
    end
  end
end
