class Sieve
  LOWER_LIMIT=2
  def initialize(limit)
    @limit = limit
    @marked_list = []
    @primes = []
  end

  def primes
    return [] if @limit < LOWER_LIMIT
    for n in 2..@limit do
      prime = get_next_unmarked n
      mark_all_multiples prime
      add_prime prime if prime <= @limit
    end
    @primes
  end

  def add_prime prime
    @primes << prime unless @primes.include? prime
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
    return "" unless prime_number
    lower_limit = prime_number + 1
    @marked_list << (lower_limit..@limit).to_a.select{ |n| n % prime_number == 0 }
    @marked_list.flatten!
  end
end

module BookKeeping
  VERSION=1
end