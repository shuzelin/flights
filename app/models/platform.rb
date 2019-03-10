class Platform
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
      sort_by_time(flight_hash_map[key])
    end.flatten
  end

  def sort_by_time(flights)
    flights.sort_by do |a, b|
      count_time_interval(a.sched) <=> count_time_interval(b.sched)
    end
  end

  def count_time_interval(time)
    (time - standard_time(time)).abs
  end

  def standard_time(time)
    time.to_date + 12.hours
  end
end
