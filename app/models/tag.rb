class Tag < ApplicationRecord

  has_many :post_tags, :dependent => :destroy
  has_many :tagged_posts, :through => :post_tags, :source => :post

  has_many :user_posts, :through => :tagged_posts, :source => :post_authorings
  has_many :authors_of_tagged_posts, :through => :user_posts, :class_name => 'User', :source => :user

end
