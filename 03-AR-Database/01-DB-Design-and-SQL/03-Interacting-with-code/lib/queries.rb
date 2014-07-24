require 'sqlite3'

# opens the database
database_path = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(database_path)

def number_of_rows(db, table_name)
  #TODO: count number of rows in table table_name
  stm = db.execute "SELECT * FROM #{table_name}"
  stm.count
end

def sorted_artists(db)
  #TODO: return array of artists' names sorted alphabetically
  stm = db.execute "SELECT name FROM artist ORDER BY name"
  stm.flatten
end

def love_tracks(db)
  #TODO: return array of love songs
  stm = db.execute "SELECT name FROM track WHERE name LIKE '%love%'"
  stm.flatten
end

def long_tracks(db, min_length)
  #TODO: return tracks verifying: duration > min_length (minutes)
  stm = db.execute "SELECT name FROM track WHERE milliseconds > #{min_length * 60000}"
  stm.flatten
end
