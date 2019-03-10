class Ajax::TweetsController < AjaxController
  def index
    tweets = Tweet.all
    render json: { status: 200, data: tweets }
  end
end
