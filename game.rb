# frozen_string_literal: false

require_relative 'helpers'
require_relative 'output'

include Hangman
include WordInProgress

def play_a_round(game_info)
  loop do
    clear_console
    mistakes = game_info[:wrong_letters].length
    print_hangman(mistakes)
    print_word_in_progress(game_info[:word_in_progress])
    print_wrong_letters(game_info[:wrong_letters])

    break if won_or_lost?(game_info[:word_in_progress], mistakes)

    letter = get_letter(game_info)

    if game_info[:word].include?(letter)
      game_info[:currect_letters].append(letter)
      game_info[:word].split('').each_with_index do |char, index|
        game_info[:word_in_progress][index] = letter if letter == char
      end
    else
      game_info[:wrong_letters].append(letter)
    end
  end
end

def load_game
  clear_console
  files = load_files
  filenumber = filenumber?(files)

  begin
    file = eval(File.read(files[filenumber]))
    play_a_round(file)
  rescue StandardError
    puts 'Load filed'
  end
end
