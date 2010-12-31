class Sieve
  def primes_below(n)
    nums = 2.upto(n).to_a
    primes = 2.upto(n).to_a

    nums.each do |num|
      primes.map! { |i| i % num == 0 && i != num && i > 2 ? nil : i }.compact!
    end

    return primes
  end
end
