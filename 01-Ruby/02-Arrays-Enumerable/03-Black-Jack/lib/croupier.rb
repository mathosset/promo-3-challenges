require_relative 'black_jack'

def play_game
  #TODO: make the user play from terminal in a while loop that will stop when the user will not be asking for  a new card
  bank = bank_score
  player_score = 0

  while asking_for_card?(player_score)
    player_score += pick_card
    puts state_of_the_game(player_score, bank)
  end
  game_outcome(bank, player_score)
  puts build_message_for(game_outcome)

end

def state_of_the_game(score, bank)
  # TODO: Returns custom message with player's score and bank's score
  return "Your score is #{score}, bank is #{bank}!"
end

def asking_for_card?(score)
  # TODO: Ask for a card only if the score is less or equal to 21, then returns true or false according to the user's choice
  if score <= 21
    puts "Cards ? (type 'Y' or 'yes' for a new card)"
    player_answer = gets.chomp
    player_answer == "yes" || player_answer == "Y"
  else
    return false
  end
end

def build_message_for(outcome)
  #TODO: return specific message depending on the game outcome (= bank's score and user's score)
  if outcome[1] == 21
    "Black Jack!"
  elsif outcome[1] > 21
    "You are over 21... you loose."
  elsif outcome[1] > outcome[0]
    "You beat the bank! You win."
  else outcome[1] < outcome[0]
    "Bank beats you! You loose."
  end
end
