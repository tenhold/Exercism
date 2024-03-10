module CollatzConjecture
  def self.steps(num)
    raise ArgumentError if num < 1

    return 0 if num == 1

    return num.even? ? 1 + steps(num / 2) : 1 + steps((num * 3) + 1)
  end
end
