class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text    :body
      t.boolean :reported, default: false

      t.timestamps
    end
  end
end
