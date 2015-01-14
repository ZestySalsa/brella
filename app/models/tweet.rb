class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :body, presence: true

  before_create :post_to_twitter

  def post_to_twitter
    user.twitter.update(body)
  end

  def self.break_up(text)
    chunks_array = []
    if text.length <= 140
      chunks_array << text
    else

    end
  end
end


tweet.body regex thing but not before (...)


