class Fibonacci
  def fib(n)
    return n if n < 2

    return fib(n - 1) + fib(n - 2)
  end

  def fib_mem(n, prev = [0, 1])
    return 0 if n == 0
    return prev[1] if n == 1

    new = prev[0] + prev[1]

    fib_mem(n - 1, [prev[1], new])
  end

  def fib_hash(n)
    fib = Hash.new do |hash, value|
      if value < 2
        hash[value] = value
      else
        hash[value] = hash[value - 1] + hash[value - 2]
      end
    end

    fib[n]
  end
end
