class DiscoverController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user.display_name
  end
end
