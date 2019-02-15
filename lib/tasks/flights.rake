namespace :flights do
  desc 'Add'
  task add: :environment do
    puts "===Add Start==="
    airline = Airline.create({
      name: "airline"
    })

    FlightTemplate.create({
      airline: airline,
      filght_number: "GD2501",
      sched: "08:00",
      from_city: "Xi'an",
      to_city: "Chengdu",
      prices: {
        FlightTemplate::WEEKDAYS_REGULAR => 110000,
        FlightTemplate::WEEKDAYS_REWARD => 80000,
        FlightTemplate::WEEKENDS_REGULAR => 90000,
        FlightTemplate::WEEKENDS_REWARD => 50000
      }
    })

    FlightTemplate.create({
      airline: airline,
      filght_number: "GD2606",
      sched: "12:25",
      from_city: "Xi'an",
      to_city: "Chengdu",
      prices: {
        FlightTemplate::WEEKDAYS_REGULAR => 160000,
        FlightTemplate::WEEKDAYS_REWARD => 110000,
        FlightTemplate::WEEKENDS_REGULAR => 60000,
        FlightTemplate::WEEKENDS_REWARD => 50000
      }
    })

    FlightTemplate.create({
      airline: airline,
      filght_number: "GD8732",
      sched: "19:30",
      from_city: "Xi'an",
      to_city: "Chengdu",
      prices: {
        FlightTemplate::WEEKDAYS_REGULAR => 220000,
        FlightTemplate::WEEKDAYS_REWARD => 100000,
        FlightTemplate::WEEKENDS_REGULAR => 150000,
        FlightTemplate::WEEKENDS_REWARD => 40000
      }
    })

    FlightTemplate.create({
      airline: airline,
      filght_number: "GD2502",
      sched: "12:00",
      from_city: "Chengdu",
      to_city: "Xi'an",
      prices: {
        FlightTemplate::WEEKDAYS_REGULAR => 170000,
        FlightTemplate::WEEKDAYS_REWARD => 80000,
        FlightTemplate::WEEKENDS_REGULAR => 90000,
        FlightTemplate::WEEKENDS_REWARD => 80000
      }
    })

    FlightTemplate.create({
      airline: airline,
      filght_number: "GD2607",
      sched: "16:25",
      from_city: "Chengdu",
      to_city: "Xi'an",
      prices: {
        FlightTemplate::WEEKDAYS_REGULAR => 160000,
        FlightTemplate::WEEKDAYS_REWARD => 110000,
        FlightTemplate::WEEKENDS_REGULAR => 60000,
        FlightTemplate::WEEKENDS_REWARD => 50000
      }
    })

    FlightTemplate.create({
      airline: airline,
      filght_number: "GD8733",
      sched: "23:30",
      from_city: "Chengdu",
      to_city: "Xi'an",
      prices: {
        FlightTemplate::WEEKDAYS_REGULAR => 160000,
        FlightTemplate::WEEKDAYS_REWARD => 150000,
        FlightTemplate::WEEKENDS_REGULAR => 100000,
        FlightTemplate::WEEKENDS_REWARD => 40000
      }
    })
    puts "===Add End==="
  end
end
