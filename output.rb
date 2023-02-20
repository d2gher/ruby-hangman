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
  end

  def promte_for_letter
    puts 'Enter a letter:'
  end

  def used_letter
    'You already used that letter.'
  end

  def print_result(result)
    sleep 1
    puts "\n#{'-' * result.length}"
    sleep 1
    puts result
    sleep 1
    puts "#{'-' * result.length}\n"
    sleep 1
  end
end
