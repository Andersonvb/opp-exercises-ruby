module Walkable
  def walk
    "#{@name} #{self.gait} forward"
  end
end

class Mammal
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Person < Mammal
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def walk
    "#{@title} #{@name} #{self.gait} forward"
  end

  private

  def gait
    "struts"
  end

end

class Cat < Mammal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Mammal
  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
puts mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
puts kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
puts flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"
