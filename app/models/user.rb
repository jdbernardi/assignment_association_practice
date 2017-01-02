class User < ApplicationRecord

  has_many :post_authorings, :class_name => 'UserPost', :dependent => :destroy
  has_many :authored_posts, :through => :post_authorings, :class_name => 'Post', :source => :post
  has_many :authored_comments, :class_name => 'Comment', :dependent => :destroy

  has_many :post_tags, :through => :authored_posts
  has_many :tags_on_authored_posts, :through => :post_tags, :class_name => 'Tag', :source => :tag

end
