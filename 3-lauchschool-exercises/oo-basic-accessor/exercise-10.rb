class Person
  def name=name
    @name, @last_name = name.split(" ")
  end

  def name
    "#{@name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
