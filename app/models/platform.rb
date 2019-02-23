class Platform
  include Mongoid::Document

  def recommend_flights(from_city: nil, to_city: nil, flighting_date: nil, passenger: nil)
    flights = Flight.where(:from_city => from_city, :to_city => to_city,
                           :sched => flighting_date.beginning_of_day..flighting_date.end_of_day)
    recommend_algorithm(flights, passenger)
  end

  private

  # 推荐航班算法
  def recommend_algorithm(flight_infos, passenger)
    return [] if flight_infos.blank?
    flight_hash_map = Hash.new
    flight_infos.each do |flight_info|
      flight_hash_map[flight_info.price(passenger)] ||= []
      flight_hash_map[flight_info.price(passenger)] += [flight_info]
    end

    flight_hash_map.keys.sort.map do |key|
      flight_hash_map[key].sort_by(&:sched)
    end.flatten
  end
end
