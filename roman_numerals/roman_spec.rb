require 'roman'

describe Roman, "initial test" do
  before(:each) do
    @conversions = {1  => "I",
                    4  => "IV",
                    5  => "V",
                    9  => "IX",
                    10 => "X"}

    @roman = Roman.new(@conversions)
  end

  it "should make the class properly" do
    @roman.conversions.should ==  @conversions
  end

  [[1,  1],
   [2,  1],
   [3,  1],
   [4,  4],
   [5,  5],
   [6,  5],
   [9,  9],
   [13, 10]].each do |input, expected|
      it "next smallest value of #{expected} should be #{input}" do
        @roman.next_smallest_value(input).should == expected
      end
   end

  [[1,  "I"   ],
   [2,  "II"  ],
   [3,  "III" ],
   [4,  "IV"  ],
   [5,  "V"   ],
   [6,  "VI"  ],
   [7,  "VII" ],
   [11, "XI"  ]].each do |input, expected|
    it "should return #{expected} for #{input}" do
      @roman.convert(input).should == expected
    end
  end
end
