class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, foreign_key: "author_id"
  has_many :tweet_reports
  has_many :reported_tweets, through: :tweet_reports, source: :tweet

  def can_remove?(tweet)
    tweets.where(id: tweet.id).count > 0
  end

  def can_report?(tweet)
    reported_tweets.where(id: tweet.id).count == 0
  end

  def has_already_reported?(tweet)
    reported_tweets.where(id: tweet.id).count > 0
  end

  def report(tweet)
    reported_tweets << tweet
  end
end
