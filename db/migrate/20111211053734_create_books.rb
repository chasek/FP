class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.text :description
      t.string :title
      t.string :subjects
      t.integer :views, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
