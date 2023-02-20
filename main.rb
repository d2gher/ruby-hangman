# frozen_string_literal: false

require_relative 'game'

words = filter_words_into_array

word = words.sample
word_in_progress = Array.new(word.length, '_').join.to_s
wrong_letters = []
currect_letters = []

play_a_round(word, word_in_progress, wrong_letters, currect_letters)
