

class TweetsController < ApplicationController

  def create
    @user = current_user

    if tweet_params
      text = ChunkyText::Chunker.new(tweet_params[:body], 140)
    
      text.chunk_array.each do |tweet_text|
        tweet = Tweet.new(body: tweet_text, user_id: @user.id) 
        tweet.post_to_twitter
      end
      
      # add a modal for tweet timeline
      flash[:success] = "Your tweet(s) has been sent!"
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