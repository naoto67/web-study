class TweetsController < ApplicationController
  before_action :logged_in?

  def new
  end
  def create
    @tweet = current_user.tweets.build(content: params[:content])
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end
end
