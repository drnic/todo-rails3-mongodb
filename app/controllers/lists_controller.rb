class ListsController < ApplicationController

  before_filter :authenticate_user!, :except => :index

  # GET /lists
  # GET /lists.xml
  def index
    @lists = List.where(:public => true).all
    respond_with(@lists)
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

end

