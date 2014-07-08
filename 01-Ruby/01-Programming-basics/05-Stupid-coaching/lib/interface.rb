require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.
Puts "what do you want to tell to your coach ?"
message = gets.chomp

unless message == "I am going to work right now SIR !"
  puts coach_answer(message)
  Puts "what do you want to tell to your coach ?"
  message = gets.chomp
end
