# frozen_string_literal: false

require_relative 'helpers'
require_relative 'output'

include Hangman
include WordInProgress

def play_a_round(word, word_in_progress, wrong_letters, currect_letters)
  message = ''
  loop do
    mistakes = wrong_letters.length
    clear_console
    puts word
    print_hangman(mistakes)
    print_word_in_progress(word_in_progress)
    puts message
    break unless word_in_progress.include?('_')
    break unless mistakes < 7

    message = ''
    letter = get_letter
    if wrong_letters.include?(letter) || currect_letters.include?(letter)
      message = used_letter
      next
    end
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