require './current_conditions'

puts "Please enter a zip code: "

current_conditions = CurrentConditions(gets.chomp)
