class AuthenticateController < ApplicationController

  def new
  end
  def create
    @user = User.find_by(id_name: params[:id_name])
    if @user
      login @user
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
end
