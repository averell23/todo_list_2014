# Raising an exception
def dangerous_method!
  raise RuntimeError, "message"
end

class MyClass

  # validates :task, presence: true

end

# puts MyClass.new.class.name

begin
  dangerous_method!
  puts "This is never executed"
rescue RuntimeError => e
  puts "I just caught an exeption, yay!"
  puts e.message
ensure
  puts "always done"
end


