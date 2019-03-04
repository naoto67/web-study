class RegisterUsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)

    if @user.save
      login @user
      redirect_to root_path
    else

    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :id_name)
    end
end
