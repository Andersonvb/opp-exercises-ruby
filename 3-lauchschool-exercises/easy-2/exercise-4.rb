class Transform 
  def initialize(str)
    @str = str
  end  

  def uppercase
    @str.upcase!
  end

  def lowercase
    str.downcase!
  end

  def self.uppercase(text)
    text.downcase
  end


  def self.lowercase(text)
    text.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
