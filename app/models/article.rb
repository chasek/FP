class Article < ActiveRecord::Base
  attr_accessible :title, :content#, :user_id

  validates :title,   :presence   => true,
                      :uniqueness => true,
                      :length     => { :maximum => 200}
  validates :content, :presence   => true
end
