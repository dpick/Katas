class WordChain
  attr_accessor :dict

  def initialize(dict)
    @dict = dict
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
end
