# frozen_string_literal: false

require 'io/console'
require_relative 'output'

include WordInProgress

def filter_words_into_array
  words = []
  File.open('words').each do |word|
    word.strip!
    words.append(word) if word.length >= 5 && word.length <= 12
  end
  words
end

def get_letter(wrong_letters, currect_letters, game_info)
  char = []
  until char.length == 1 && char.match?(/[[:alpha:]]/)
    promte_for_letter
    temp = gets.chomp
    save_game(game_info) if temp.downcase.tr('^a-z', '') == 'save'
    if wrong_letters.include?(temp) || currect_letters.include?(temp)
      puts used_letter
    else
      char = temp
    end
  end
  char
end

def clear_console
  $stdout.clear_screen
end

def won_or_lost?(word_in_progress, mistakes)
  unless word_in_progress.include?('_')
    print_result('You won! No hanging for today')
    return true
  end

  unless mistakes < 7
    print_result("You lost! Maybe death isn't so bad")
    return true
  end
  false
end

def save_game(game_info)
  filename = ''
  while filename == ''
    puts 'Enter a name for the save file'
    filename = gets.chomp
  end

  Dir.mkdir('savefiles') unless Dir.exist?('savefiles')
  File.open("savefiles/#{filename}", 'w') do |file|
    file.puts game_info
  end
end

def game_state(word, word_in_progress, wrong_letters, currect_letters)
  {
    :word => word,
    :word_in_progress => word_in_progress,
    :wrong_letters => wrong_letters,
    :currect_letters => currect_letters
  }
end
