# frozen_string_literal: false

# Module for printing hangman
module Hangman
  def print_hangman(stage)
    puts '-----------------'
    puts "You can save him!"
    puts '-----------------'
    case stage
    when 0
      puts "
    _________
    |        |
             |
             |
             |
             |
  ___________|

"
    when 1
      puts "
    _________
    |        |
    o        |
             |
             |
             |
  ___________|

"
    when 2
      puts "
    _________
    |        |
    o        |
    |        |
             |
             |
  ___________|

"
    when 3
      puts "
    _________
    |        |
    o        |
    |        |
    |        |
             |
  ___________|

"
    when 4
      puts "
    _________
    |        |
    o        |
   /|        |
    |        |
             |
  ___________|

"
    when 5
      puts "
    _________
    |        |
    o        |
   /|\\       |
    |        |
             |
  ___________|

"
    when 6
      puts "
    _________
    |        |
    o        |
   /|\\       |
    |        |
   /         |
  ___________|

"
    when 7
      puts "
    _________
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

  def print_wrong_letters(letters)
    print 'Wrong letters: '
    letters.each do |letter|
      print "#{letter} "
    end
    puts ''
    puts ''
  end

  def promte_for_letter
    puts 'Enter a letter, or wirte "save" to save your progress:'
  end

  def used_letter
    'You already used that letter.'
  end

  def print_result(result)
    sleep 1
    puts "#{'-' * result.length}"
    sleep 1
    puts result
    sleep 1
    puts "#{'-' * result.length}\n"
    sleep 1
  end
end

# Modul for messages to be output
module Messages
  def print_welcome_screen
    puts "\033[1mHangman\033[0m
A vast vocabulary saves lives!

Try saving your loved one from hanging
by guessing the correct word"
  end

  def print_pick_option
    puts "
Pick an option: 1. New game
                2. Load game
                Ctrl + C to exit
"
  end

  def print_load_game_message
    puts 'Enter the number of file to load:'
  end
end
