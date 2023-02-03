class FixedArray

  def initialize(size)
    @array = Array.new(size, nil)
  end

  def to_a
    @array
  end

  def to_s
    @array.to_s
  end

  def fetch(index)
    @array.fetch(index)
  end

  def [](index)
    raise IndexError if index < (@array.size * -1) || index >= @array.size 
    @array[index]
  end

  def []=(index, value)
    raise IndexError if index < (@array.size * -1) || index >= @array.size 
    @array[index] = value
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5


fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array.fetch(6) 
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array.fetch(7) 
  puts false
rescue IndexError
  puts true
end
