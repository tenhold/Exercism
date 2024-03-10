require 'pry'
module TwelveDays
  DAYS = {
    first: 'a',
    second: 'two',
    third: 'three',
    forth: 'four',
    fifth: 'five',
    sixth: 'six',
    seventh: 'seven',
    eighth: 'eight',
    ninth: 'nine',
    tenth: 'ten',
    eleventh: 'eleven',
    twelfth: 'tweleve'
  }

  def self.last_glue
    'and'
  end

  def self.day_of_christmas(day)
    "On the #{day} day of Christmas my true love gave to me:"
  end

  def self.first
    'Partridge in a Pear Tree'
  end

  def self.second
    'Turtle Doves'
  end

  def self.third
    'French Hens'
  end

  def self.forth
    'Calling Birds'
  end

  def self.fifth
    'Gold Rings'
  end

  def self.sixth
    'Geese-a-Laying'
  end

  def self.seventh
    'Swans-a-Swimming'
  end

  def self.eighth
    'Maids-a-Milking'
  end

  def self.ninth
    'Ladies Dancing'
  end

  def self.tenth
    'Lords-a-Leaping'
  end

  def self.eleventh
    'Pipers Piping'
  end

  def self.tweleve
    'Drummers Drumming'
  end

  def self.song
    song = ''

    puts "#{day_of_christmas(DAYS.first.first)} #{DAYS.first.last} #{first}."
  end
end

TwelveDays.song
