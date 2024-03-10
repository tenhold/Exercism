module Hamming
  def self.compute(dna1, dna2)
    raise ArgumentError if dna1.length != dna2.length

    @dna1 = dna1
    @dna2 = dna2

    get_total
  end

  def self.combine_strings
    @dna1.chars.zip(@dna2.chars)
  end

  def self.get_total
    return 0 if @dna1 == @dna2

    combine_strings.count { |one, two| one != two }
  end
end
