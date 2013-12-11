class Tweet < ActiveRecord::Base
  PERMITTED_REPORT_COUNT = 2

  belongs_to :author, class_name: "User"
  has_many :tweet_reports
  has_many :reporters, through: :tweet_reports, source: :user

  validates :author, presence: true
  validates :body, presence: true, length: { maximum: 140 }

  scope :most_recent, -> { order("created_at DESC") }
  scope :published,   -> { where("tweet_reports_count <= ?", PERMITTED_REPORT_COUNT) }
end
