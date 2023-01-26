class Cat
  attr_accessor :name

  @@total = 0

  def initialize(name)
    @name = name
    @@total += 1
  end

  def self.total
    @@total
  end
end

kitty = Cat.new('Sophie')
kitty2 = Cat.new("Sophie")

puts Cat.total

