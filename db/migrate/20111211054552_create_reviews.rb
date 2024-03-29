class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
