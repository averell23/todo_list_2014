module SomeModule
  def my_method
    puts "I am a happy module"
  end
end

class FunClass
  include SomeModule
end

class MoreFunClass
  include SomeModule
end

FunClass.new.my_method
