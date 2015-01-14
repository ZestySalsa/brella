class TweetsController < ApplicationController

  def create
    @user = current_user
    # 1. parse the text into 140 char chunks add to arr
    # 2. loop the array and send each chunk

    if tweet_params
      tweet_chunks = Tweet.break_up(tweet_params[:body])
      # ['ssssssss', 'sssssssss']
    
      tweet_chunks.each do |tweet_chunk|
        tweet = Tweet.new(tweet: tweet_chunk, user_id: @user.id) 
        tweet.post_to_twitter
      end
      
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