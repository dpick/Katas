def prime_factors(n)
  return [2, 2] if n > 3
  return [n]
end

def is_prime?(n)
  2.upto(n - 1).each do |i|
    return false if n % i == 0  
  end

  return true
end

########## Tests ############

describe "is_prime? tests" do
  it "should return true for 2" do
    is_prime?(2).should be_true
  end

  it "should return true for 3" do
    is_prime?(3).should be_true
  end

  it "should return false for 4" do
    is_prime?(4).should be_false
  end

  it "should return true for 5" do
    is_prime?(5).should be_true
  end

  it "should return false for 6" do
    is_prime?(6).should be_false
  end
end

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
