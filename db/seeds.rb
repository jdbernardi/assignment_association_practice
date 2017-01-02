# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# You'll see little puts statements in the file to give you status updates as the file runs.
puts "Destroying old records"

# Blow away all the existing records every time.

User.destroy_all
Post.destroy_all
Tag.destroy_all
Comment.destroy_all
Category.destroy_all
UserPost.destroy_all
PostTag.destroy_all

puts "Old records destroyed"

MULTIPLIER = 10

def generate_category
  category = Category.new
  category[:name]        = Faker::Commerce.department
  category.save
end



def generate_user
  name = Faker::Name.name

  u = User.new
  u[ :name ] = name
  u.save

end

def generate_tags

	t = Tag.new
	t.name = Faker::Lorem.word
	t.save!

end

def generate_posts

	p = Post.new

	p[ :title ] = Faker::Lorem.sentence
	p[ :body ] = Faker::Lorem.paragraphs
	p[ :category_id ] = Category.pluck( :id ).sample

	p.save!

	user = User.all.sample

	user_post = UserPost.new

	user_post[ :post_id ] = p.id
	user_post[ :user_id ] = user.id

	user_post.save!

	tag = Tag.all.sample

	pt = PostTag.new

	pt[ :post_id ] = p.id
	pt[ :tag_id ] = tag.id

	pt.save!

end


def generate_comments

	user = User.all.sample
	post = Post.all.sample

	c = Comment.new
	c[ :body ] = Faker::Lorem.paragraphs
	c[ :post_id ] = post.id
	c[ :user_id ] = user.id

	c.save!

end


puts "Create categories"
(MULTIPLIER * 10).times { generate_category }
puts "Created categories"

# Create users
(MULTIPLIER * 10).times { generate_user }
puts "Created users"

puts "Create tags"
(MULTIPLIER * 10).times { generate_tags }
puts "Created tags"
puts "Create posts"
(MULTIPLIER * 10).times { generate_posts }
puts "Created posts"

puts "Create comments"
(MULTIPLIER * 10).times { generate_comments }
puts "Created comments"







puts "DONE!"


