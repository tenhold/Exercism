class Phrase
  attr_reader :words

  def initialize(word)
    @words = word.downcase.scan(/\b(?:\w+(?:'\w+)?)+\b/)
  end

  def word_count
    words.group_by(&:itself).transform_values(&:count)
  end
end
