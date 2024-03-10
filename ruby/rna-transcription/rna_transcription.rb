module Complement
  DNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }
  def self.of_dna(dna)
    dna.chars.map { |d| DNA[d] || '' }.join
  end
end
