# frozen_string_literal: false

require_relative 'helpers'
require_relative 'output'

include Hangman
include WordInProgress

def play_a_round(word, word_in_progress, wrong_letters, currect_letters)
  loop do
    mistakes = wrong_letters.length
    clear_console
    puts word
    print_hangman(mistakes)
    print_word_in_progress(word_in_progress)
    print_wrong_letters(wrong_letters)

    break if won_or_lost?(word_in_progress, mistakes)

    game_info = game_state(word, word_in_progress, wrong_letters, currect_letters)
    letter = get_letter(wrong_letters, currect_letters, game_info)

    if word.include?(letter)
      currect_letters.append(letter)
      word.split('').each_with_index do |char, index|
        word_in_progress[index] = letter if letter == char
      end
    else
      wrong_letters.append(letter)
    end
  end
end

def load_game
  clear_console
  files = load_files
  filenumber = filenumber?(files)

  begin
    file = eval(File.read(files[filenumber]))
    word = file[:word]
    word_in_progress = file[:word_in_progress]
    wrong_letters = file[:wrong_letters]
    currect_letters = file[:currect_letters]

    play_a_round(word, word_in_progress, wrong_letters, currect_letters)
  rescue
    puts "Load filed"
  end
end
