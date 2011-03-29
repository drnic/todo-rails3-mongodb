require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when :user, User
      user_lists_path current_user
    else
      super
    end
  end
end
