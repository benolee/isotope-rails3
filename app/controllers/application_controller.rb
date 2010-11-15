# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #######################################################################
  private
  #######################################################################

  def admin?
    current_user.admin
  end

  def require_admin
    unless current_user && admin?
      flash[:error] = "You need to be an admin to do that."
      redirect_to root_path
    end
  end

end
