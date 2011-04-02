class Users::WatchingController < ApplicationController

  before_filter :authenticate_user!

  def index
    @lists = current_user.watching
    respond_with(@lists)
  end

  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

end
