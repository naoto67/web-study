class StaticController < ApplicationController
  before_action do
    logged_in?
  end
  def index
    @tweets = Tweet.all
  end
end
