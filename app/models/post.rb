class Post < ApplicationRecord

	has_many :users

	belongs_to :category, :foreign_key => "category_id"

	has_many :tags

end
