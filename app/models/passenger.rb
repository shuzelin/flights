class Passenger
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :name, type: String
  enum :category, [:ordinary, :reward], :default => :ordinary

  def make_journey(departing_date: nil, returning_date: nil,
                   to_city: nil, from_city: nil)
    Passengers::Journey.new(
      passenger: self,
      departing_date: departing_date,
      returning_date: returning_date,
      to_city: to_city,
      from_city: from_city
    )
  end
end
