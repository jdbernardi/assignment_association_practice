class Post < ApplicationRecord

	has_many :users

	belongs_to :category

	has_many :tags

end
