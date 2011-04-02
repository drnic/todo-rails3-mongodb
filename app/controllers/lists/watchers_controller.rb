class Lists::WatchersController < ApplicationController

  before_filter :authenticate_user!

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
