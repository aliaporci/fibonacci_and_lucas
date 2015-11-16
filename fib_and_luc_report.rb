# defines a function for finding the nth Fibonacci number
def fibonacci(n)
  return n unless n > 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

# defines a function for finding the nth Lucas number which uses the same
# recursion as the Fibonacci numbers, but different initial values
def lucas(n)
  if n > 1
    return lucas(n - 1) + lucas(n - 2)
  elsif n == 1
    return 1
  else
    return 2
  end
end

puts 'Give me a number?'

nth_member = gets.chomp.to_i

# the ratio between consecutive Fibonacci numbers converges to the Golden Ratio
# as n -> infinity
fib_ratio = fibonacci(nth_member).to_f / fibonacci(nth_member - 1).to_f

# likewise, the ratio between consecutive Lucas numbers converges to the Golden
# Ratio as n -> infinity
luc_ratio = lucas(nth_member).to_f / lucas(nth_member - 1).to_f
puts ''
puts '*************************************************************************'
puts "F(#{nth_member}) = #{fibonacci(nth_member)}"
puts ''
puts 'Based on the Fibonacci sequence, the golden ratio is approximately:'
puts "#{fib_ratio}"
puts '*************************************************************************'
puts ''
puts '*************************************************************************'
puts "L(#{nth_member}) = #{lucas(nth_member)}"
puts ''
puts 'Based on the Lucas sequence, the golden ratio is approximately:'
puts "#{luc_ratio}"
puts '*************************************************************************'
puts ''
puts 'For reference, this means:'
puts ''
puts "F(#{nth_member}) - L(#{nth_member}) = #{fib_ratio - luc_ratio}"

def fib_array(n)
  starting_fib_ary = (0..n).to_a.map do |k|
    fibonacci(k)
  end
  new_fib_ary = starting_fib_ary.map { |k| starting_fib_ary[k] }.compact
  puts ''
  puts 'The first n elements of the Fibonacci sequence are:'
  puts "#{starting_fib_ary}"
  puts ''
  puts "The first #{new_fib_ary.count} elements of the F(F(n)) sequence are:"
  puts "#{new_fib_ary}"
end

def luc_array(n)
  starting_luc_ary = (0..n).to_a.map do |k|
    lucas(k)
  end
  new_luc_ary = starting_luc_ary.map { |k| starting_luc_ary[k] }.compact
  puts ''
  puts 'The first n elements of the Lucas sequence are:'
  puts "#{starting_luc_ary}"
  puts ''
  puts "The first #{new_luc_ary.count} elements of the L(L(n)) sequence are:"
  puts "#{new_luc_ary}"
end

fib_array(nth_member)
luc_array(nth_member)
puts ''
puts 'Make of all of that what you will.'
