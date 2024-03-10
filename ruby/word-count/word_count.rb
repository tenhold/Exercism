class Phrase
  attr_reader :words

  def initialize(word)
    @words = word.downcase.scan(/\b(?:\w+(?:'\w+)?)+\b/)
  end

  def word_count
    words_hash = Hash.new(0)
    words.each { |w| words_hash[w] += 1 }

    words_hash
  end
end
