class Flight
  attr_accessor :database_handle

  def initialize(flight_number, database_handle)
    @database_handle = database_handle
    @flight_number = flight_number
  end

  def some_method
    # use the database_handle here
    database_handle.close
  end
end
