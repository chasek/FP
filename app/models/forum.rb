class Forum < ActiveRecord::Base
  attr_accessible :title#, :book_id

  belongs_to :book
  has_many   :topics

  validates :title, :presence => true,
                    :length => { :maximum => 200 }
end
