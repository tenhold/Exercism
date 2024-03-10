module Blackjack
  SPLIT = 'P'
  STAND = 'S'
  HIT = 'H'
  WIN = 'W'

  def self.parse_card(card)
    case card
      when 'one' then 1
      when 'two' then 2
      when 'three' then 3
      when 'four' then 4
      when 'five' then 5
      when 'six' then 6
      when 'seven' then 7
      when 'eight' then 8
      when 'nine' then 9
      when 'ten', 'jack', 'queen', 'king' then 10
      when 'ace' then 11
      when 'joker' then 0
      else -1
    end
  end

  def self.card_range(card1, card2)
    sum = parse_card(card1) + parse_card(card2)

    case
      when sum <= 11 then 'low'
      when sum <= 16 then 'mid'
      when sum <= 20 then 'high'
      when sum == 21 then 'blackjack'
    end
  end

  def self.blackjack?(card1, card2)
    parse_card(card1) + parse_card(card2) == 21
  end

# - If you have a pair of aces you must always split them.
# - If you have a Blackjack (two cards that sum up to a value of 21), and the dealer does not have an ace, a figure or a ten then you automatically win.
#   If the dealer does have any of those cards then you'll have to stand and wait for the reveal of the other card.
# - If your cards sum up to a value within the range [17, 20] you should always stand.
# - If your cards sum up to a value within the range [12, 16] you should always stand unless the dealer has a 7 or higher, in which case you should always hit.
# - If your cards sum up to 11 or lower you should always hit.
  def self.first_turn(card1, card2, dealer_card)

    case
      when card1 == 'ace' && card2 == 'ace' then SPLIT
      when blackjack?(card1, card2) && parse_card(dealer_card) < 10 then WIN
      when blackjack?(card1, card2) && parse_card(dealer_card) > 10 then STAND
      when card_range(card1, card2) == 'high' then STAND
      when card_range(card1, card2) == 'mid' && parse_card(dealer_card) >= 7 then HIT
      when card_range(card1, card2) == 'mid' && parse_card(dealer_card) <= 7 then STAND
      when parse_card(card1) + parse_card(card2) <= 11 then HIT
    end

  end
end
