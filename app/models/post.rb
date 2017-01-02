class Post < ApplicationRecord

	has_many :authors, :through => :post_authorings, :class_name => 'User', :source => :user

	has_many :post_authorings, :class_name => 'UserPost', :dependent => :destroy

	belongs_to :category

	has_many :tags, :through => :post_tags

	has_many :comments, :dependent => :destroy

	has_many :post_tags, :dependent => :destroy

	accepts_nested_attributes_for :comments, :reject_if => :ll_blank, :allow_destroy => :true

end
