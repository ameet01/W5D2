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

User.create(username: 'Brooke', password: 'aloogobiburrito')
User.create(username: 'Claire', password: 'mounttamhikes')
User.create(username: 'Scott', password: 'handshakes')
User.create(username: 'Quinn', password: 'dumbledore')

Sub.create(title: 'App Academy Drama', description: 'Staff Secrets', moderator_id: 2)
Sub.create(title: 'Dogs', description: 'Worse than cats (TM)', moderator_id: 4)
Sub.create(title: 'Food', description: 'Always hungry.', moderator_id: 1)

Post.create(title: 'Who stole my lunch?', user_id: 1, content: 'No seriously, guys, where is it?', sub_ids:[1,3])
Post.create(title: 'Reggie the Reject Bear: MISSING', user_id: 3, content: 'Discovered at 12:35am this morning.', sub_ids:[1])
Post.create(title: 'Newfoundland/Daschund friendship', user_id: 4, content: 'Thoughts?', sub_ids: [2])
Post.create(title: 'Cookies', user_id: 2, content: 'These are so good! \n http://allrecipes.com/recipe/11032/oatmeal-craisin-cookies/?scale=12&ismetric=0', sub_ids: [3])
Post.create(title: 'Curry Up Now', user_id: 1, content: 'Aloo Gobi Burrito forever <3', sub_ids: [3])

# Comment.create(post_id: 1, user_id: 2, body: 'Not me...')
# Comment.create(post_id: 2, user_id: 1, body: 'I saw Jeff leaving the building with a large duffel bag last night. Could\'ve been smuggling him out.')
# Comment.create(post_id: 3, user_id: 3, body: 'That\'s us!')
# Comment.create(post_id: 4, user_id: 4, body: 'Let\'s ask Jordan to make them :)')
# Comment.create(post_id: 5, user_id: 2, body: 'Punjabi by Nature burrito forever!')
