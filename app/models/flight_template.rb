class FlightTemplate
  include Mongoid::Document
  include Mongoid::Timestamps

  WEEKDAYS_REGULAR = "WEEKDAYS Regular"
  WEEKDAYS_REWARD = "WEEKDAYS Reward"
  WEEKENDS_REGULAR = "WEEKENDS Regular"
  WEEKENDS_REWARD = "WEEKENDS Reward"

  field :filght_number, type: String
  field :from_city, type: String
  field :to_city, type: String
  field :sched, type: String
  field :prices, type: Hash, default: {}

  belongs_to :airline

  def create_flight_info(flighting_date: nil)
    Flight.create({
      filght_number: self.filght_number,
      from_city: self.from_city,
      to_city: self.to_city,
      airline: self.airline,
      sched: Time.parse(I18n.l(flighting_date) + " " + self.sched),
      regular_price: count_price(flighting_date, "Regular"),
      reward_price: count_price(flighting_date, "Reward")
    })
  end

  private

  def count_price(flighting_date, type)
    type =
      if is_week_end?(flighting_date)
        "WEEKENDS #{type}"
      else
        "WEEKDAYS #{type}"
      end
    prices[type]
  end

  def is_week_end?(date)
    [0, 6].include?(date.wday)
  end
end
