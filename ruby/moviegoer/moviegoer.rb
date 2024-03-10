# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  TICKET_PRICES = {
    discount: 10,
    full: 15
  }.freeze
  DISCOUNT_AGE = 60
  SCARY_AGE = 18

  attr_reader :age, :member

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    age >= DISCOUNT_AGE ? TICKET_PRICES[:discount] : TICKET_PRICES[:full]
  end

  def watch_scary_movie?
    age >= SCARY_AGE
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    !!member ? '🍿' : raise(NotMovieClubMemberError)
  end
end
