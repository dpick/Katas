class Anagram
  attr_accessor :word_list, :current_word_hash

  def initialize(word_list)
    @word_list = word_list
    @current_word_hash = {}
    @current_word = ""
  end

  def find_all_anagrams
    all_anagrams = []
    already_found = []

    @word_list.each do |word|
      if not already_found.include?(word)
        anagrams_of_word = (find_anagrams_of(word) << word)
        anagrams_of_word.each { |word| already_found << word }

        if anagrams_of_word.size > 1
          all_anagrams << anagrams_of_word 
          puts anagrams_of_word
        end
      end
    end

    return all_anagrams
  end

  def find_anagrams_of(word)
    set_word_hash(word)
    anagrams = []

    @word_list.each do |word|
      anagrams << word if are_anagrams?(word) and word != @current_word
    end

    return anagrams
  end

  def are_anagrams?(word)
    return false if word.size != @current_word.size

    word.split("").each do |letter|
      return false if @current_word_hash[letter].nil?
    end

    return true
  end

  def set_word_hash(word)
    @current_word_hash = {}
    @current_word = word

    word.split("").each do |letter|
      @current_word_hash[letter] = true
    end
  end
end
