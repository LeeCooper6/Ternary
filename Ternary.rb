# Binary is base 2 meaning binary numbers are 0 or 1.
# Ternary is base 3 meaning ternary numbers are 0, 1, or 2.
# This ternary allows -1, 0, or 1 for symmetry's sake.
# This ternary "rotates" circularly through values: -1 => 0 => 1.
# This ternary spins in either direction: -1 => 0 => 1 or 1 => 0 => -1.
# This ternary rolls over and loops circularly from 1 to -1 or -1 to 1. So -1 => 0 => 1 => -1... or 1 => 0 => -1 => 1...
class Ternary
  # Creates reader for value attribute.
  attr_reader :value

  # Alias for set. See set.
  def initialize value
    set value
  end

  # Sets value to legal values: -1, 0, or 1.
  # Parameters: Anything that can be converted to an integer. Out-of-bounds values will be curbed to -1 or 1.
  # Returns: New value: -1, 0, or 1.
  def set value
    # Duck typing.
    raise "Invalid argument type." unless value.respond_to?(:to_i)
    value = value.to_i

    # Set value within legal range (-1, 0, 1).
    @value = value
    @value = 1 if @value > 1
    @value = -1 if @value < -1
    
    # Return value.
    @value
  end

  # Resets value to 0.
  # Parameters: None.
  # Returns: 0.
  def reset
    @value = 0
  end

  # Negates current value. Sets -1 to 1, 1 to -1, and does nothing to 0.
  # Parameters: None.
  # Returns: Negation of value.
  def negate
    @value *= -1
  end

  # Rotates through legal values: -1 => 0 => 1, rolls over back to -1.
  # Parameters: Anything that can be converted to an integer. Sign determines whether to rotate forwards or backwards, magnitued determines how many times to rotate. Rotations default to 1.
  # Returns: New value.
  def rotate rotations = 1
    # Duck typing.
    raise "Invalid argument type." unless rotations.respond_to?(:to_i)
    rotations = rotations.to_i

    # Rotate the specified nmber of times.
    rotations.abs.times do
      rotations >= 0 ? @value += 1 : @value -= 1 # Rotate forwards or backwards depending on sign of rotations.
      @value = -1 if @value > 1
      @value = 1 if @value < -1
    end

    # Return value.
    @value
  end

  # Alias method. See rotate.
  def spin rotations = 1
    rotate rotations
  end

  # Alias method. See rotate.
  def next rotations = 1
    rotate rotations
  end

  # Semi-alias method. Rotates, but in reverse order, as if rotate's argument was inversed. See rotate.
  def prev rotations = 1
    rotate -1 * rotations
  end
end