# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sub.destroy_all
Post.destroy_all

user1 = User.create(username: 'Ameet', password: 'hahahaha')
user2 = User.create(username: 'Jimmy', password: 'hahahaha')

Sub.create(title: 'Game of Thrones', description: 'You know nothing John Show.', moderator_id: user1.id)
Sub.create(title: 'Friends', description: 'The televisoin show', moderator_id: user2.id)
Sub.create(title: 'Food', description: 'Always hungry.', moderator_id: user1.id)

5.times do
  Post.create(title: Faker::Friends.quote, user_id: user1.id, url: 'www.gameofthrones.com', content: Faker::RickAndMorty.quote, sub_ids: [2])
end
5.times do
  Post.create(title: Faker::StarWars.quote, user_id: user2.id, content: Faker::StarWars.wookiee_sentence, sub_ids: [1])
end
5.times do
  Post.create(title: Faker::WorldOfWarcraft.quote, user_id: user1.id, content: Faker::Coffee.notes, sub_ids: [3])
end

# Comment.create(post_id: 1, user_id: 2, body: 'Not me...')
# Comment.create(post_id: 2, user_id: 1, body: 'I saw Jeff leaving the building with a large duffel bag last night. Could\'ve been smuggling him out.')
# Comment.create(post_id: 3, user_id: 3, body: 'That\'s us!')
# Comment.create(post_id: 4, user_id: 4, body: 'Let\'s ask Jordan to make them :)')
# Comment.create(post_id: 5, user_id: 2, body: 'Punjabi by Nature burrito forever!')
