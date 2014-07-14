#Encoding: utf-8
require 'csv'
filepath    = '/Users/caroline/code/mathosset/promo-3-challenges/01-Ruby/06-Parsing/01-CSV-Parsing/lib/movies.csv'

def most_successfull(number, max_year, file_name)
  #TODO: return the number most successfull movies max_year
  csv_options = { col_sep: ',', encoding: "ISO-8859-1:UTF-8"}
  films = []

  CSV.foreach(file_name, csv_options) do |row|

    film = {}

    if row[1].to_i < max_year
      if films.size < number
        films << film = {name: row[0], year: row[1].to_i, earnings: row[2].to_i}
      end
    end
  end
  films
end

puts most_successfull(4,2009,filepath)
