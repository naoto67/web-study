class StaticController < ApplicationController
  def index
    @tweets = Tweet.all
  end
end
