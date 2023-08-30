User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

users = []
30.times do
  users << User.create(
    email: Faker::Internet.email(name: Faker::Name.name),
    name: Faker::Name.name,
    bio: Faker::Quote.most_interesting_man_in_the_world,
    photo: "https://unsplash.com/photos/abcdef",
    password: "123456"
  )
end

# users.each do |user|
#   rand(1..5).times do
#     post = user.posts.create(
#       title: Faker::Book.title,
#       body: Faker::Quote.famous_last_words,
#     )

#     rand(0..5).times do
#       post.comments.create(
#         text: Faker::Lorem.sentence,
#         author: users.sample
#       )
#     end

#     post.update(likes_counter: rand(0..100))
#   end
# end
