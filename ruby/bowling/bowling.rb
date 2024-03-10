class Game
  class BowlingError < StandardError
  end

  MAX_FRAMES = 10
  PINS_PER_FRAME = 10

  attr_reader :frames, :current_frame

  def initialize
    @frames = Array.new(MAX_FRAMES) { [] }
    @current_frame = 0
  end

  def roll(pins)
    frame = frames[current_frame]
    return if game_over?

    frame << pins

    if last_frame? && (strike?(pins) || frame.sum == PINS_PER_FRAME)
      frame << nil if frame.size < 3 # handle last frame
      @current_frame += 1
    elsif frame.size == 2 || strike?(pins)
      @current_frame += 1
    end
  end

  def validate_roll(pins)
    raise 'Invalid number of pins' unless (0..PINS_PER_FRAME).include?(pins)
    raise 'Frame is full' if frames[current_frame].size == 2 && !last_frame?
  end

  def score
    score = 0

    MAX_FRAMES.times do |i|
      frame = frames[i]
      frame_total = frame_sum(frame)

      if strike?(frame.first)
        frame_total += strike_bonus(i)
      elsif spare?(frame)
        frame_total += spare_bonus(i)
      end

      score += frame_total
      # puts "i: #{i} frame: #{frame} #{scores}"
    end

    score
  end

  private

  def strike?(pins)
    pins == PINS_PER_FRAME
  end

  def spare?(frame)
    frame.sum == MAX_FRAMES
  end

  def strike_bonus(frame_idx)
    frames[frame_idx + 1].first(2).compact.sum
  end

  def spare_bonus(frame_idx)
    frames[frame_idx + 1].first
  end

  def frame_sum(frame)
    frame.compact.sum
  end

  def last_frame?
    current_frame == MAX_FRAMES - 1
  end

  def game_over?
    current_frame == MAX_FRAMES
  end
end
