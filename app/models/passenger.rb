class Passenger
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  CATEGORIES = [:ordinary, :reward]

  field :name, type: String
  enum :category, CATEGORIES, :default => :ordinary

  def make_trip(departing_date: nil, returning_date: nil,
                to_city: nil, from_city: nil)
    Passengers::Trip.new(
      passenger: self,
      departing_date: departing_date,
      returning_date: returning_date,
      to_city: to_city,
      from_city: from_city
    )
  end
end
