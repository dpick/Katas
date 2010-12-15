require 'anagram'

describe 'anagram tests' do
  before(:each) do
    @dict = ['hi', 'sink', 'skin', 'bat', 'tab', 'the', 'dog']
    @anagram = Anagram.new(@dict)
  end

  it "should initalize properly" do
    @anagram.word_list.should == @dict
  end

  it "should parse a word correctly and put each letter in the word hash" do
    @anagram.set_word_hash("skin")
    @anagram.current_word_hash["s"].nil?.should be_false
    @anagram.current_word_hash["k"].nil?.should be_false
    @anagram.current_word_hash["i"].nil?.should be_false
    @anagram.current_word_hash["n"].nil?.should be_false
  end

  it "should parse a word correctly and only its letters should be in the word hash" do
    @anagram.set_word_hash("skin")
    @anagram.current_word_hash["a"].nil?.should be_true
    @anagram.current_word_hash["k"].nil?.should be_false
    @anagram.current_word_hash["t"].nil?.should be_true
  end

  it "should return true for skin and sink" do
    @anagram.set_word_hash("skin")
    @anagram.are_anagrams?("sink").should be_true
  end

  it "should return false for skin and tab" do
    @anagram.set_word_hash("skin")
    @anagram.are_anagrams?("tab").should be_false
  end

  it "should return false for skin and skins" do
    @anagram.set_word_hash("skin")
    @anagram.are_anagrams?("skins").should be_false
  end

  it "should return sink and skin for niks" do
    @anagram.find_anagrams_of("niks").should == ["sink", "skin"]
  end

  it "should return sink for skin" do
    @anagram.find_anagrams_of("skin")
  end

  it "should return all anagrams from the dictionary" do
    @anagram.find_all_anagrams.should == [["skin", "sink"], ["tab", "bat"]]
  end
end
