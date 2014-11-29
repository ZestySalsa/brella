class AddBodyToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :body, :string
  end
end
