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
      logger.error "Attempt to access invalid list #{params[:id]}"
      redirect_to root_url, :alert => "Invalid list"
    else
      respond_with(@list)
    end
  end

end

