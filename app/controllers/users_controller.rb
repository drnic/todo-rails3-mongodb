class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    respond_with(@user = User.find(params[:id]))
  end

end
