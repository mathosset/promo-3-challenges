require 'open-uri'
require 'json'

def generate_grid(grid_size)
  #TODO: generate random grid of letters
  letters = []
  for i in (1..grid_size) do
    letters << ("A".."Z").to_a.sample
  end
  return letters
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result
  json_url = "http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}"
  hash = {}
  open (json_url) do |stream|
    hash = JSON.parse(stream.read)
  end

  array = []
  attempt.upcase.split("").each do |letter|
    if grid.include? letter
      array << true
    else
      array << false
    end
  end

  if array.include?(false)

    result = {
        time: end_time - start_time,
        translation: nil,
        score: 0,
        message: "not in the grid"
      }

  elsif hash["Error"] != nil

    result = {
      time: end_time - start_time,
      translation: nil,
      score: 0,
      message: "not an english word"
    }

  elsif
    result = {
      time: end_time - start_time,
      translation: hash["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"],
      score: (1/(end_time-start_time)*1/(grid.size-attempt.size)),
      message: "well done"
    }
  end

  return result
end
