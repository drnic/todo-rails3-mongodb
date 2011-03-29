class HomeController < ApplicationController

  def index
    respond_with(@users = User.all)
  end

end
