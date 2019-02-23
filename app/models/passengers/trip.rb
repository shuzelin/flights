class Passengers::Trip
  attr_accessor :passenger, :departing_date, :returning_date, :to_city,
                :from_city, :departing_flight, :returning_flight

  def initialize(passenger: nil, departing_date: nil, returning_date: nil,
                 to_city: nil, from_city: nil)
    self.passenger = passenger
    self.departing_date = departing_date
    self.returning_date = returning_date
    self.to_city = to_city
    self.from_city = from_city
    choose_flights
  end

  private

  # 选择航班
  def choose_flights
    platform = Platform.new
    # 通过平台查询推荐的航班
    departing_flight_infos = platform.recommend_flights(from_city: self.from_city,
                                                        to_city: self.to_city,
                                                        flighting_date: departing_date,
                                                        passenger: self.passenger)
    if returning_date.present?
      returning_flight_infos = platform.recommend_flights(from_city: self.to_city,
                                                          to_city: self.from_city,
                                                          flighting_date: returning_date,
                                                          passenger: self.passenger)
    end
    # 选择推荐的第一个航班，作为最优的航班
    self.departing_flight = departing_flight_infos.first
    self.returning_flight = returning_flight_infos.first if returning_flight_infos.present?
  end
end
