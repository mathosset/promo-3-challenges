require_relative "crud"

def ask_and_get(param)
  puts "What is the #{param} for your post?"
  gets.chomp
end

db_path = "db/news.sqlite"
db = SQLite3::Database.new(db_path)

create_scheme(db)

while true

  puts "Hey you, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Update a post"
  puts "5. Delete a specific post"
  puts "6. Exit"

  # TODO: add other CRUD tasks if you wish!
	choice =  gets.chomp.to_i
  def line(n)
    puts "*" * n
  end

  def display_post(post)
    id = post[0]
    name = post[1]
    url = post[2]
    rating = post[3]
    date = post[4]
    puts "id: #{id} - name : #{name} - #{rating} - #{url} #{date}"
  end

	case choice
  when 1
    name = ask_and_get("name")
    source_url = ask_and_get("source url")
    rating = ask_and_get("rating")
    post = { name: name, source_url: source_url, date: Time.now, rating: rating }
    create_post(db, post)
    line(30)
  when 2
    line(30)
    if get_posts(db) == []
      puts "there is no post in the db"
    else
      post = get_posts(db)
      display_post(post)
    end
    line(30)
  when 3
    line(30)
    delete_posts(db)
    puts "All posts have been deleted."
    line(30)
  when 4
    id = ask_and_get("id")
    name = ask_and_get("name")
    update_post(db,id,name)
    line(30)
  when 5
    id = ask_and_get("id")
    delete_post(db,id)
    line(30)
  when 6
    break
	end
end