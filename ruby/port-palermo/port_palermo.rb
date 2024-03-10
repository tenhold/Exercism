module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0..3].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    ship_identifier.match?(/GAS|OIL/) ? :A : :B
  end
end
