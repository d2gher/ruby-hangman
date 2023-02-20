# frozen_string_literal: false

def filter_words_into_array
  words = []
  File.open('words').each do |word|
    word.strip!
    words.append(word) if word.length >= 5 && word.length <= 12
  end
  words
end
