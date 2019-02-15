class Airline
  include Mongoid::Document
  field :name, type: String

  has_many :flight_infos
  has_many :flight_templates

  def valid_flight_infos(from_city: nil, to_city: nil, flighting_date: nil)
    self.flight_infos.where(:from_city => from_city, :to_city => to_city,
                            :sched => flighting_date.beginning_of_day..flighting_date.end_of_day)
  end

  # 发布航班信息
  def publish_flight_infos(flighting_date)
    templates = self.flight_templates

    templates.each do |template|
      template.create_flight_info(flighting_date: flighting_date)
    end
  end
end
