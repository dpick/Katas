def prime_factors(n)
  prime_factors = []
  check_value = 2

  while (check_value <= n)
    if n % check_value == 0
      prime_factors << check_value
      n = n / check_value
    else
      check_value += 1
    end
  end

  return prime_factors
end

def primes_below(n)
  values = 0.upto(n).to_a

  2.upto(n).each do |i|
    if values[i] != nil && i * i <= n
      (i * i..n).step(i).each do |j|
        values[j] = nil
      end
    end
  end

  values.shift
  values.shift
  values.compact!
  
  return values
end

def is_prime?(n)
  2.upto(n - 1).each do |i|
    return false if n % i == 0  
  end

  return true
end

########## Tests ############

describe "primes_below tests" do
  it "should return [2,3,5,7] for 10" do
    primes_below(10).should == [2,3,5,7]
  end

  it "should return primes below 20" do
    primes_below(20).should == [2,3,5,7,11,13,17,19]
  end

  it "should return primes below 100" do
    primes_below(100).should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
  end
end

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

  it "should return [5] for 5" do
    prime_factors(5).should == [5]
  end

  it "should return [2, 3] for 6" do
    prime_factors(6).should == [2, 3]
  end
end
