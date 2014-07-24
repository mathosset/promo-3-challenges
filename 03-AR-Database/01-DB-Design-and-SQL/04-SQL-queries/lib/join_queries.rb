require 'sqlite3'

# opens the database
DATABASE_PATH = "lib/db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  stm = db.execute "SELECT t.name, al.title, ar.name FROM track t
                    JOIN album al ON (t.albumid = al.albumid)
                    JOIN artist ar ON (al.artistid = ar.artistid)"
  stm.flatten
end

def stats_on(db, category)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  stm = db.execute "SELECT COUNT(track.trackid), AVG(track.Milliseconds) FROM track
                    JOIN genre g ON (track.genreid = g.genreid)
                    WHERE g.name LIKE '%#{category}%'"
  hash = Hash.new
  hash = {
    "category:" => category,
    "number_of_songs:" => stm[0][0],
    "avg_length:" => stm[0][1]/60000
  }
  return hash
end

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists
  stm = db.execute "SELECT ar.name, COUNT(*) AS n
                    FROM artist ar
                    JOIN album al ON (t.albumid = al.albumid)
                    JOIN track t ON (t.albumid = al.albumid)
                    JOIN genre g ON (t.genreid = g.genreid)
                    GROUP BY ar.name
                    ORDER BY n DESC
                    LIMIT 5"
  stm.flatten
end
