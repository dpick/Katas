require 'sieve'

describe "prime tests" do
  before(:each) do
    @sieve = Sieve.new
  end

  [[0,  []],
   [1,  []],
   [2,  [2]],
   [4,  [2, 3]],
   [5,  [2, 3, 5]],
   [10, [2, 3, 5, 7]]].each do |input, output|
     it "should return #{output} for #{input}" do
      @sieve.primes_below(input).should == output
     end
   end
end
