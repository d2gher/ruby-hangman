# frozen_string_literal: false

require_relative 'game'

words = filter_words_into_array

word = words.sample
word_in_progress = Array.new(word.length, '_').join.to_s
wrong_letters = []
currect_letters = []

files = Dir['savefiles/*']
files.each_with_index do |file, index|
  puts "#{index + 1}. #{file.gsub('savefiles/', '')}"
end

puts 'Enter the number of file to load:'
filenumber = gets.chomp

file = eval(File.read(files[filenumber.to_i - 1]))

word = file[:word]
word_in_progress = file[:word_in_progress]
wrong_letters = file[:wrong_letters]
currect_letters = file[:currect_letters]

play_a_round(word, word_in_progress, wrong_letters, currect_letters)
