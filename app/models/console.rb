class Console
  include Tools::ValidatesTool

  def initialize
    while true do
      begin
        puts "INPUT:"
        puts "<CUSTOMER_TYPE>, <DEPARTING_DATE>, <RETURNING_DATE>, <FROM_CITY>, <TO_CITY>"
        input = gets.chomp
        break if input.strip == "exit"
        infos = input.split(",").map(&:strip)
        raise "inputs is error!" if infos.blank? || infos.length < 3
        passenger = Passenger.new category: infos[0].strip.to_sym
        departing_date = build_date(infos[1])
        returning_date = build_date(infos[2])
        raise "returning_date can't before departing_date" if returning_date < departing_date
        from_city = build_city(infos[3])
        to_city = build_city(infos[4])
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
end
