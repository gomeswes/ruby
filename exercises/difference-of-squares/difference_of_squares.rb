class Squares
  def initialize(number)
    @number = number
  end
  
  def square_of_sum
    sum = 0
    for i in 1..@number
      sum += i
    end
    sum ** 2
  end

  def sum_of_squares
    sum = 0
    for i in 1..@number
      sum += i ** 2
    end
    sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION=4
end