class CreateTweetReports < ActiveRecord::Migration
  def change
    create_table :tweet_reports do |t|
      t.belongs_to :user,  index: true
      t.belongs_to :tweet, index: true

      t.timestamps
    end
  end
end
