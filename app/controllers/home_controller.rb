class HomeController < ApplicationController
  def index
    @tweet = Tweet.new

    if session[:user_id]
      @user = User.find(session[:user_id]) 
      @timeline_tweets = @user.twitter.user_timeline.first(5)
    end
  end

end