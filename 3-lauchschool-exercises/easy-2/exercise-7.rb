class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end
end

class Owner
  attr_reader :name 
  attr_accessor :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end

class Shelter
  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    @adoptions[owner.name.to_sym] = [] if @adoptions[owner.name.to_sym].nil?
    @adoptions[owner.name.to_sym] = @adoptions[owner.name.to_sym] << pet
    owner.number_of_pets += 1
  end

  def print_adoptions
    @adoptions.each do |owner_name, pets|
      puts "#{owner_name.to_s} has adopted the following pets:"
      pets.each { |pet| puts "a #{pet.animal} named #{pet.name}" }
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
