class FlightInfo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filght_number, type: String
  field :from_city, type: String
  field :to_city, type: String
  field :sched, type: DateTime
  field :regular_price, type: Integer
  field :reward_price, type: Integer

  belongs_to :airline

  def price(passenger)
    passenger.reward? ? reward_price : regular_price
  end
end
