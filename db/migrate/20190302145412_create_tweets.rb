class CreateTweets < ActiveRecord::Migration[5.2]
  def up
    create_table :tweets do |t|
      t.string :content, default: '', null: false
      t.references :users, foreign_key: true, null: false
    end
  end

  def down
    drop_table :tweets
  end
end
