class Users::WatchingController < ApplicationController

  before_filter :authenticate_user!

  def index
    @lists = current_user.watching
    respond_with(@lists)
  end

  def show
    begin
      @list = List.find(params[:id])
    rescue BSON::InvalidObjectId, Mongoid::Errors::DocumentNotFound
      redirect_to root_url, :alert => "Attempt to access invalid list"
    else
      respond_with(@list)
    end
  end

end

