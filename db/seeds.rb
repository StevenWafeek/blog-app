# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all

User.transaction do
  Comment.destroy_all

  30.times do
    user = User.create(
      name: Faker::Name.name,
      photo: "https://unsplash.com/photos/abcdef",
      bio: Faker::Quote.most_interesting_man_in_the_world,
      posts_counter: rand(1..40)
    )

    user.posts_counter.times do
      post = Post.create(
        author: user,
        title: Faker::Book.title,
        text: Faker::Quote.famous_last_words,
        comments_counter: 0,
        likes_counter: 0
      )

      rand(0..5).times do
        post.comments.create(
          text: Faker::Lorem.sentence,
          author: User.all.sample
        )
      end

      post.update(likes_counter: rand(0..100))
    end
  end
end
