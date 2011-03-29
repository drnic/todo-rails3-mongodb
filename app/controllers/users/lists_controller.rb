class Users::ListsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @lists = current_user.lists
    respond_with(@lists)
  end

end
