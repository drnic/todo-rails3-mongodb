class Users::ListsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @lists = current_user.lists
    respond_with(current_user, @lists)
  end

  def show
    begin
      @list = List.find(params[:id])
    rescue BSON::InvalidObjectId, Mongoid::Errors::DocumentNotFound
      redirect_to root_url, :alert => "Attempt to access invalid list"
    else
      respond_with(current_user, @list)
    end
  end

  def new
    @list = List.new
    @list.tasks.build
    respond_with(current_user, @list)
  end

  def edit
    @list = List.find(params[:id])
    @list.tasks.build unless !@list.tasks.empty?
    respond_with(current_user, @list)
  end

  def create
    @list = current_user.lists.new(params[:list])
    @list.save
    respond_with(current_user, @list)
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with(current_user, @list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_with(current_user, @list)
  end

end

