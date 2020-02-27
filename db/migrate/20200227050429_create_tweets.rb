class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :post
      t.bigint :user_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tweets, :user_id
  end
end
