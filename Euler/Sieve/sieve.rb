class Sieve
  def primes_below(n)
    nums = (2..n).to_a

    nums.each do |num|
      nums.map! { |i| i % num == 0 && i != num ? nil : i }.compact!
    end
  end
end
