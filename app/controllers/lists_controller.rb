class ListsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :unless_is_valid_list_and_not_private, :except => :index

  def index
    @lists = List.where(:public => true).excludes(:user_id => current_user._id).all
    respond_with(@lists)
  end

  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  def unless_is_valid_list_and_not_private
    begin
      list = List.find(params[:id])
      unless list.public?
        redirect_to root_url, :alert => "Attempt to access invalid list"
      end
    rescue BSON::InvalidObjectId, Mongoid::Errors::DocumentNotFound
      redirect_to root_url, :alert => "Attempt to access invalid list"
    end
  end

end

