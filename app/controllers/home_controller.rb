class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @user = User.find(session[:user_id]) if session[:user_id]
  end

end