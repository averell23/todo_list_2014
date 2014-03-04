my_array = [1,2,3,4,7]

my_array.each do |number|
  puts '   ' + number.to_s
end

def every_second(enum)
  enum.each do |element|
    if element.to_i % 2 == 0
      yield(element)
    end
  end
end

every_second(my_array) do |el|
  puts "  " + el.to_s
end
