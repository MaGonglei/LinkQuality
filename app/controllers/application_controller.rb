class ApplicationController < ActionController::Base
  protect_from_forgery

  #force_ssl

  #rescue_from Exception, :with => :user_not_authorized

  #def default_url_options
  #  {:locale => I18n.locale}
  #end

  #USERS = { "name" => "pw" }

  #before_filter :authenticate

  #private
  #
  #def user_not_authorized
  #  flash[:notice] = "You don't have access to this section."
  #  redirect_to :back
  #end

  #def authenticate
  #  authenticate_or_request_with_http_digest do |username|
  #    USERS[username]
  #  end
  #end
end
