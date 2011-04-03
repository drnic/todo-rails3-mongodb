class Lists::WatchersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_current_list

  def find_current_list
    begin
      @list = List.find(params[:list_id])
    rescue BSON::InvalidObjectId, Mongoid::Errors::DocumentNotFound
      logger.error "Attempt to access invalid list #{params[:list_id]}"
      redirect_to root_url, :alert => "Invalid list"
    end
  end

  def create
    @list = List.find(params[:list_id])
    @list.add_watcher(current_user)
    respond_with(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @list.remove_watcher(current_user)
    respond_with(@list)
  end

end

