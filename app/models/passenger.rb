class Passenger
  attr_accessor :name, :category

  CATEGORIES = [:ordinary, :reward]

  def initialize(name: nil, category: nil)
    self.name = name
    if Passenger::CATEGORIES.exclude? category
      raise "<CUSTOMER_TYPE> should be ordinary or reward"
    end
    self.category = category
  end

  def make_trip(departing_date: nil, returning_date: nil,
                to_city: "Chengdu", from_city: "Xi'an")
    Passengers::Trip.new(
      passenger: self,
      departing_date: departing_date,
      returning_date: returning_date,
      to_city: to_city,
      from_city: from_city
    )
  end
end
