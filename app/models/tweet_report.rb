class TweetReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet, counter_cache: true
end
