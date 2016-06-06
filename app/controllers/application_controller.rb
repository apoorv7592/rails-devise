class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  #before_action :authenticate_user! 
  before_filter :set_default_response_format
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        nil
      end
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to login_path, :alert => "Access denied."
      end
    end

    def authenticate_user!
      unless user_signed_in?
        redirect_to login_path,:alert => 'You need to sign in for access to this page.'
      end
    end


    def set_default_response_format
      if params[:source] == "mobile"
       request.format = :json
      else
        request.format = :html
      end
    end


end
