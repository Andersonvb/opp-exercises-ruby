module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, my name is #{name}!"
  end
end

cat = Cat.new("Sophie")
cat.greet
cat.walk
