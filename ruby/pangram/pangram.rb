module Pangram
  def self.pangram?(sentence)
    ('a'..'z').all? { |l| sentence.downcase.include?(l) }
  end
end
