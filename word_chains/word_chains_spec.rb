require 'word_chains'

describe "word_chains" do
  before(:each) do
    dict = { 3 => ["cat",
                   "cot",
                   "cog",
                   "dog",
                   "the"]}
    @chain = WordChain.new(dict)
  end

  it "should load the dictionary right" do
    @chain.dict.should == { 3 => ["cat",
                                  "cot",
                                  "cog",
                                  "dog",
                                  "the"]}
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

  it "should return ['cot'] for 'cat'" do
    @chain.all_one_off_words("cat").should == ["cot"]
  end

  it "should return [] for 'the'" do
    @chain.all_one_off_words("the").should == []
  end

  it "should return ['cot'] for 'cat'" do
    @chain.unvisited_one_off_words("cat").should == ["cot"]
  end

  it "should search" do
    @chain.search("cat", "dog", ["cat"]).should == ["cat", "cot", "cog", "dog"]
  end
end
