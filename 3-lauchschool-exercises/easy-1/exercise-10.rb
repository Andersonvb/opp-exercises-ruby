class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    raise "Not implemented"
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle

  def initialize(make, model)
    super(make, model)
  end

  def wheels
    4
  end
end

class Motorcycle < Vehicle

  def initialize(make, model)
    super(make, model)
  end

  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end
