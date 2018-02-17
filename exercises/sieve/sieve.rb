require "benchmark"
class Sieve
  LOWER_LIMIT=2
  def initialize(limit)
    @limit = limit
    @marked_list = []
    @primes = []
  end

  def primes_with_benchmark
    numbers = 0
    benchmark = Benchmark.measure do
      numbers = primes
    end
    puts "Time: #{benchmark.total} sec"
    [benchmark, numbers.size]
  end

  def primes
    return [] if @limit < LOWER_LIMIT
    current = LOWER_LIMIT
    while true
      current = get_next_unmarked current
      mark_all_multiples current
      add_prime current
      current += 1
      break if current >= @limit
    end
    @primes
  end

  def wiki_benchmark
    primes = []
    measure = Benchmark.measure do
      primes = wiki_implementation
    end
    [primes.size, measure]
  end
  def wiki_implementation
    a = []
    0.upto(@limit) do |number|
      a << true
    end
    primes = []
    for i in 2..@limit do
      if a[i]
        j=i**2
        counter = 1
        while true do
          a[j] = false
          j=(i**2)+counter*i
          break if j > @limit
          counter += 1
        end
        primes << i
      end
    end
    primes
  end

  private
    def add_prime prime
      @primes << prime unless prime > @limit
    end

    def get_next_unmarked current
      return current unless @primes.any?
      unless (@marked_list.include? current)
        return current
      else
        current += 1
        get_next_unmarked current
      end
    end

    def mark_all_multiples prime_number
      lower_limit = prime_number + 1
      not_marked = (lower_limit..@limit).to_a - (@marked_list)
      not_marked.select! {|n| is_multiple? prime_number, n}
      @marked_list = @marked_list + not_marked
      @marked_list
    end

    def is_multiple? prime, candidate
      candidate % prime == 0
    end
end

module BookKeeping
  VERSION=1
end