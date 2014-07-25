require 'sqlite3'

def create_scheme(db)
  #TODO: create your db scheme
  sql = %q{ CREATE TABLE IF NOT EXISTS posts
    (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(100),
    source_url VARCHAR(100),
    date DATETIME,
    rating INT
    )
  }  # %q allows for multiline string in ruby
  db.execute(sql)
end

def create_post(db, post)
  #TODO: add a new post to your db
  stm = db.execute "INSERT INTO posts (name, source_url, date, rating)
                    VALUES ('#{post[:name]}', '#{post[:source_url]}', '#{post[:date]}', #{post[:rating]} )"
end

def get_posts(db)
   #TODO: list all posts
  stm = db.execute "SELECT * FROM posts"
  stm.flatten
end

def get_post(db, id)
  #TODO: get a specific post
  stm = db.execute "SELECT * FROM posts WHERE id = id"
end

def update_post(db, id, name)
	#TODO: update a post's name in your db
  stm = db.execute "UPDATE posts SET name = '#{name}'
                    WHERE id = #{id}"
end

def delete_posts(db)
  #TODO: delete all post in your db
  stm = db.execute "DELETE FROM posts"
end

def delete_post(db, id)
  #TODO: delete a specific post in your db
  stm = db.execute "DELETE FROM posts
                    WHERE id = #{id}"
end