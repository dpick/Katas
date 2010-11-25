require 'word_chains'

describe "word_chains" do
  before(:each) do
    dict = ['a', 'b', 'c', 'd']
    @chain = WordChain.new(dict)
  end

  it "should load the dictionary right" do
    @chain.dict.should == ['a', 'b', 'c', 'd']
  end

  it "should return true for cat and cot" do
    @chain.one_letter_difference?("cat", "cot").should be_true
  end

  it "should be false for cat and dog" do
    @chain.one_letter_difference?("cat", "dog").should be_false
  end

  it "should be false for cat and tag" do
    @chain.one_letter_difference?("cat", "tag").should be_false
  end

  it "should return true for words of the same length" do
    @chain.same_length?("one", "the").should be_true
  end

  it "should return false for words with a different length" do
    @chain.same_length?("blah", "foo").should be_false
  end
end
