require 'pp'

class WordChain
  attr_accessor :dict

  def initialize(dict)
    @dict = dict
    @visited_words = []
  end

  def one_letter_difference?(first_word, second_word)
    difference_count = 0

    0.upto(first_word.length).each do |i|
      difference_count += 1 if first_word[i] != second_word[i] 
    end

    difference_count == 1
  end

  def same_length?(first, second)
    first.length == second.length
  end

  def all_one_off_words(word)
    one_off_words = []

    @dict[word.length].each do |same_length_word|
      one_off_words << same_length_word if one_letter_difference?(word, same_length_word)  
    end

    return one_off_words
  end

  def remove_starting_word(word)
    @dict[word.length].delete(word)
  end

  def unvisited_one_off_words(word)
    all_one_off_words(word) - @visited_words
  end

  def search(word, end_word, chain)
    @visited_words << word

    unvisited_one_off_words(word).each do |unvisited_word|
      chain << unvisited_word
      return chain if unvisited_word == end_word
      return search(unvisited_word, end_word, chain)
    end
  end
end
