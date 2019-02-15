class Passengers::Journey
  attr_accessor :passenger, :departing_date, :returning_date, :to_city,
                :from_city, :departing_flight, :returning_flight

  def initialize(passenger: nil, departing_date: nil, returning_date: nil,
                 to_city: nil, from_city: nil)
    self.passenger = passenger
    self.departing_date = departing_date
    self.returning_date = returning_date
    self.to_city = to_city
    self.from_city = from_city
    optimized_journey
  end

  private

  def optimized_journey
    departing_flight_infos = []
    returning_flight_infos = []
    Airline.all.each do |airline|
      departing_flight_infos = departing_flight_infos + \
                               airline.valid_flight_infos(from_city: self.from_city,
                                                          to_city: self.to_city,
                                                          flighting_date: departing_date)
      next if returning_date.blank?
      returning_flight_infos = returning_flight_infos + \
                               airline.valid_flight_infos(from_city: self.to_city,
                                                          to_city: self.from_city,
                                                          flighting_date: returning_date)
    end
    self.departing_flight = optimized_flight(departing_flight_infos)
    self.returning_flight = optimized_flight(returning_flight_infos) if returning_flight_infos.present?
  end

  def optimized_flight(flight_infos)
    return if flight_infos.blank?
    flight_hash_map = Hash.new
    flight_infos.each do |flight_info|
      flight_hash_map[flight_info.price(self.passenger)] ||= []
      flight_hash_map[flight_info.price(self.passenger)] += [flight_info]
    end
    lower_price = flight_hash_map.keys.sort.first
    return flight_hash_map[lower_price].first if flight_hash_map[lower_price]&.length == 1
    flight_hash_map[lower_price].sort_by(&:sched).first
  end
end
