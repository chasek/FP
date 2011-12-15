class Review < ActiveRecord::Base
  attr_accessible :content, :rating#, :user_id, :book_id

  belongs_to :book

  validates :content, :presence => true
  validates :rating,  :presence => true,
                      :inclusion => {:in => 1..100}
end
