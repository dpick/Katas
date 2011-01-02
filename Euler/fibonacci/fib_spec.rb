require 'fib'

describe "regular fib tests" do
  before(:each) do
    @fib = Fibonacci.new
  end

  [

    [0, 0],
    [1, 1],
    [2, 1],
    [3, 2],
    [4, 3],
    [5, 5],
    [6, 8],
    [7, 13],
    [8, 21],
    [9, 34],
    [10, 55]

  ].each do |input, output|
    it "should return #{output} for #{input}" do
      @fib.fib(input).should == output
    end

    it "should return #{output} for #{input} with memoized fib" do
      @fib.fib_mem(input).should == output
    end

    it "should return #{output} for #{input} with new hash trick" do
      @fib.fib_hash(input).should == output
    end
  end
end
