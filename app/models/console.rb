class Console
  def initialize
    while true do
      begin
        puts "INPUT:"
        puts "<CUSTOMER_TYPE>, <DEPARTING_DATE>, <RETURNING_DATE>, <FROM_CITY>, <TO_CITY>"
        input = gets.chomp
        break if input.strip == "exit"
        infos = input.split(",")
        raise "inputs is error!" if infos.blank? || infos.length < 3
        passenger = build_passenger(infos[0].strip.to_sym)
        departing_date = build_date(infos[1].strip)
        returning_date = build_date(infos[2].strip)
        raise "returning_date can't before departing_date" if returning_date < departing_date
        from_city = build_city(infos[3]&.strip).presence || "Chengdu"
        to_city = build_city(infos[4]&.strip).presence || "Xi'an"
        trip = passenger.make_trip(departing_date: departing_date,
                                   returning_date: returning_date,
                                   to_city: to_city, from_city: from_city)

        puts "OUTPUT:"
        puts trip.departing_flight&.filght_number
        puts trip.returning_flight.filght_number if trip.returning_flight.present?
      rescue Exception  => e
        puts e.message
      end
    end

  end

  private

  def build_passenger(passenger_category)
    if Passenger::CATEGORIES.exclude? passenger_category
      raise "<CUSTOMER_TYPE> should be ordinary or reward"
    end
    Passenger.new category: passenger_category
  end

  def build_date(date_string)
    begin
      Date.parse date_string.strip
    rescue
      raise "#{date_string} is not a valid parameter!"
    end
  end

  def build_city(city)
    return if city.blank?
    raise "#{city} is not a valid parameter!" if ["Chengdu", "Xi'an"].exclude?(city)
  end
end
