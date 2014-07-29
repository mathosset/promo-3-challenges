require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'

User.where(name: "Mat", email: "mat@gmail.com").first_or_create

p User.last

def ask(prompt)
  print "#{prompt} "
  gets.to_s.chomp
end

def create_post(user)
  name = ask('Name:')
  source_url = ask('Source URL:')
  rating = ask('Rating:')
  post_params = { name: name, source_url: source_url, date: Time.now, rating: rating }

  # TODO: use ActiveRecord to add a new post for the user logged in!
  user.posts.create(post_params)
end

def list_posts(user)
  # TODO: use ActiveRecord to get all posts of the current user
  p user.posts.all

end

def delete_posts(user)
  # TODO: use Act useriveRecord to delete all posts of current user
  user.posts.delete_all
end

logged_in = false

until logged_in
  puts 'Please login with your <id>'
  # TODO: instantiate a user with his <id>
  id = gets.chomp
  user = User.find(id)
  logged_in = true
end

while true

  puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Exit"

  case ask('>').to_i
  when 1 then create_post(user)
  when 2 then list_posts(user)
  when 3 then delete_posts(user)
  when 4 then break
  end
end
