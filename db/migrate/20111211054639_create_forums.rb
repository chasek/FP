class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :title
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
