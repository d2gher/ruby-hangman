# frozen_string_literal: false

require_relative 'game'
require_relative 'output'

include Messages

words = filter_words_into_array

clear_console
print_welcome_screen

loop do
  word = words.sample
  word_in_progress = Array.new(word.length, '_').join.to_s
  game_info = game_state(word, word_in_progress, [], [])

  option = 0
  until [1, 2].include?(option)
    print_pick_option
    option = gets.chomp.to_i
  end

  play_a_round(game_info) if option == 1
  load_game if option == 2
end
