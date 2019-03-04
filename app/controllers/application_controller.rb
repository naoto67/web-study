class ApplicationController < ActionController::Base

  private
    def login(user)
      session[:user_id] = user.id
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logout
      session[:user_id] = nil
      @current_user = nil
    end

    def logged_in?
      redirect_to login_path if current_user
    end
end
