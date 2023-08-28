# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = []
30.times do |i|
  users << User.create(
    name: "User #{i + 1}",
    photo: "https://unsplash.com/photos/abcdef",
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    posts_counter: rand(1..10)
  )
end

users.each do |user|
  user.posts_counter.times do |i|
    Post.create(
      author_id: user.id,
      title: "Hello Post #{i + 1} by #{user.name}",
      text: "Hi",
      comments_counter: 0,
      likes_counter: 0
    )
  end
end

User.all.each do |user|
  user.posts.each do |post|
    rand(0..5).times do
      post.comments.create(
        text: Faker::Lorem.sentence,
        author: User.all.sample
      )
    end

    post.update(likes_counter: rand(0..20))
  end
end
