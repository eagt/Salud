class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #ßinclude SessionsHelper
  #around_filter :user_time_zone, if: :current_user

  helper_method :current_user

  def current_user
    # Take the URL to extract the resource: [Professional or Company]
    resource= request.path.split('/')[1]
      @is_company = resource == "companies" ? true : false
      if resource && params[resource.singularize+"_id"]
        @current_user = resource.singularize.classify.constantize.find(params[resource.singularize+"_id"])
        end
      end
end
