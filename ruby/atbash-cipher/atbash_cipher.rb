module Atbash
  FROM = ('a'..'z').to_a.join
  TO = ('a'..'z').to_a.reverse.join

  def self.encode(text)
    decode(text)
      .chars
      .each_slice(5)
      .map(&:join)
      .join(' ')
  end

  def self.decode(text)
    text.downcase.gsub(/\W/, '').tr(FROM, TO)
  end
end
