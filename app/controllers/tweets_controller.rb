class TweetsController < ApplicationController

  def create
    @user = current_user
    @tweet = Tweet.new(tweet_params.merge(user_id: @user.id))
    if @tweet.valid? 
      @tweet.post_to_twitter
      flash[:success] = "Your tweet has been sent!"
      redirect_to root_path
    else
      flash[:error] = "The tweet can't be empty."
      render 'home/index'
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body)
    end
end