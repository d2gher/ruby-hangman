# frozen_string_literal: false

require_relative 'helpers'
require_relative 'output'

include Hangman
include WordInProgress

words = filter_words_into_array
word = words.sample
word_in_progress = Array.new(word.length, '_').join.to_s

puts word
print_word_in_progress(word_in_progress)
