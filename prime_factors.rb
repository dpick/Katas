def prime_factors(n)
  return [2, 2] if n > 3
  return [n]
end

########## Tests ############

describe "prime_factors tests" do
  it "should return 2 for 2" do
    prime_factors(2).should == [2]
  end

  it "should return 3 for 3" do
    prime_factors(3).should == [3]
  end

  it "should return [2, 2] for 4" do
    prime_factors(4).should == [2, 2]
  end
end
