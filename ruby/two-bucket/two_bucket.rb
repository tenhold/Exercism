# - There are only 3 possible actions:
#   1. Pouring one bucket into the other bucket until either:
#      a) the first bucket is empty
#      b) the second bucket is full
#   2. Emptying a bucket and doing nothing to the other.
#   3. Filling a bucket and doing nothing to the other.
require 'pry'
class TwoBucket

  attr_accessor :buckets
  attr_reader :goal , :goal_bucket

  def initialize(one, two, goal, goal_bucket)
    @buckets = { 'one' => one, 'two' => two }
    @goal = goal
    @goal_bucket = goal_bucket
  end

  def moves
    4
  end

  def other_bucket
    buckets.filter { |(bucket, size)| goal_bucket != bucket }.values.first
  end
end
