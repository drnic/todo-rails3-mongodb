class Users::ListsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_current_list, :only => [:show, :edit, :update, :destroy]

  def find_current_list
    begin
      @list = List.find(params[:id])
    rescue BSON::InvalidObjectId, Mongoid::Errors::DocumentNotFound
      logger.error "Attempt to access invalid list #{params[:id]}"
      redirect_to root_url, :alert => "Invalid list"
    end
  end

  def index
    @lists = current_user.lists
    respond_with(current_user, @lists)
  end

  def show
    respond_with(current_user, @list)
  end

  def new
    @list = List.new
    @list.tasks.build
    respond_with(current_user, @list)
  end

  def edit
    @list.tasks.build unless !@list.tasks.empty?
    respond_with(current_user, @list)
  end

  def create
    @list = current_user.lists.new(params[:list])
    @list.save
    respond_with(current_user, @list)
  end

  def update
    @list.update_attributes(params[:list])
    respond_with(current_user, @list)
  end

  def destroy
    @list.destroy
    respond_with(current_user, @list)
  end

end

