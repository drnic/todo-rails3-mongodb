class ListsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @lists = List.where(:public => true).excludes(:user_id => current_user._id).all
    respond_with(@lists)
  end

  def show
    begin
      @list = List.find(params[:id])
      redirect_to root_url, :alert => "Invalid list" unless @list.public?
    rescue BSON::InvalidObjectId, Mongoid::Errors::DocumentNotFound
      logger.error "Attempt to access invalid list #{params[:id]}"
      redirect_to root_url, :alert => "Invalid list"
    else
      respond_with(@list)
    end
  end

end

