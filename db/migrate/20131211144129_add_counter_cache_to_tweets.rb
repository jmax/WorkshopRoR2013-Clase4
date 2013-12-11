class AddCounterCacheToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_reports_count, :integer, default: 0
    add_index  :tweets, :tweet_reports_count
  end
end
