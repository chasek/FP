class Book < ActiveRecord::Base
  attr_accessible :description, :title, :subjects

  has_one  :forum
  has_many :reviews

  validates :description, :presence => true
  validates :title,       :presence => true,
                          :length   => { :maximum => 150 }
end
