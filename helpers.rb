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

def get_letter
  char = []
  until char.length == 1 && char.match?(/[[:alpha:]]/)
    promte_for_letter
    char = gets.chomp
  end
  char
end

def clear_console
  $stdout.clear_screen # or STDOUT.clear_screen
end
