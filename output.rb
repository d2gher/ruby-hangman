# frozen_string_literal: false

# Module for printing hangman
module Hangman
  def hangman(stage)
    case stage
    when 0
      puts "
    ________
   |        |
            |
            |
            |
            |
 ___________|

      "
    when 1
      puts "
    ________
    |        |
    o        |
             |
             |
             |
  ___________|
"
    when 2
      puts "
    ________
    |        |
    o        |
    |        |
             |
             |
  ___________|
"
    when 3
      puts "
    ________
    |        |
    o        |
    |        |
    |        |
             |
  ___________|
"
    when 4
      puts "
    ________
    |        |
    o        |
   /|        |
    |        |
             |
  ___________|
"
    when 5
      puts "
    ________
    |        |
    o        |
   /|\\       |
    |        |
             |
  ___________|
"
    when 6
      puts "
    ________
    |        |
    o        |
   /|\\       |
    |        |
   /         |
  ___________|
"
    when 7
      puts "
    ________
    |        |
    o        |
   /|\\       |
    |        |
   / \\       |
  ___________|
"
    end
  end
end

# Module for printing words
module WordInProgress
  def print_word_in_progress(word)
    puts word.gsub(/\w/) { |w| " #{w} " }
    puts ''
  end
end
