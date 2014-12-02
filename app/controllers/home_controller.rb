class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @user = User.find(session[:user_id]) if session[:user_id]
    @timeline_tweets = @user.twitter.user_timeline.first(5)
  end

end