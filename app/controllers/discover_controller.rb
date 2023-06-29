class DiscoverController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @tracks = Track.all
  end
end
