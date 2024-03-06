# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

3.times do |i|
  Category.create!(
    name: "Category #{i}"
  )
end

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'fake_password',
    password_confirmation: 'fake_password'
  )
end

categories = Category.all
users = User.all

30.times do
  Post.create!(
    user_id: users.sample.id,
    category_id: categories.sample.id,
    title: Faker::Lorem.paragraph,
    body: Faker::Lorem.paragraph_by_chars
  )
end

post = Post.first
user = User.first

5.times do |i|
  post.comments.create(content: "content #{i}", user_id: user.id)
end
