# Requires & includes Ternary and Assertions.
require_relative "Ternary.rb"
require "test/unit/assertions"
include Test::Unit::Assertions

# Tests methods.
ternary_test = Ternary.new -1
assert_equal -1, ternary_test.value, "Failed Constructor or Reader."
assert_equal 0, ternary_test.reset, "Failed Reset."
assert_equal -1, ternary_test.set(-1), "Failed Write."
assert_equal 1, ternary_test.negate, "Failed Negate."
assert_equal -1, ternary_test.set(-5.5), "Failed Overflow Write."

assert_equal 0, ternary_test.rotate, "Failed 1 Forward Rotation."
assert_equal -1, ternary_test.rotate(-1), "Failed 1 Backward Rotation."
assert_equal 1, ternary_test.rotate(2), "Failed 2 Forward Rotations."
assert_equal -1, ternary_test.rotate(-2), "Failed 2 Backward Rotations."
assert_equal -1, ternary_test.rotate(3), "Failed 3 Forward Rotations (Identity)."
assert_equal -1, ternary_test.rotate(-3), "Failed 3 Backward Rotations (Identity)."

assert_equal 0, ternary_test.next, "Failed 1 Forward Rotation."
assert_equal -1, ternary_test.next(-1), "Failed 1 Backward Rotation."
assert_equal 1, ternary_test.next(2), "Failed 2 Forward Rotations."
assert_equal -1, ternary_test.next(-2), "Failed 2 Backward Rotations."
assert_equal -1, ternary_test.next(3), "Failed 3 Forward Rotations (Identity)."
assert_equal -1, ternary_test.next(-3), "Failed 3 Backward Rotations (Identity)."

assert_equal 1, ternary_test.prev, "Failed 1 Backward Rotation."
assert_equal -1, ternary_test.prev(-1), "Failed 1 Forward Rotation."
assert_equal 0, ternary_test.prev(2), "Failed 2 Backward Rotations."
assert_equal -1, ternary_test.prev(-2), "Failed 2 Forward Rotations."
assert_equal -1, ternary_test.prev(3), "Failed 3 Backward Rotations (Identity)."
assert_equal -1, ternary_test.prev(-3), "Failed 3 Forward Rotations (Identity)."

# Measures speed.
iterations = 1000000
start_time = Time.now
ternary_test.rotate iterations
end_time = Time.now
completion_time = end_time - start_time
puts "Time to complete " << iterations.to_s << " iterations: " << completion_time.to_s << " seconds."

puts "All tests complete."