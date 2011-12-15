class Topic < ActiveRecord::Base
  attr_accessible :title#, :user_id

  belongs_to :forum
  has_many   :posts

  validates :title, :presence => true,
                    :length => { :maximum => 200 }
end
