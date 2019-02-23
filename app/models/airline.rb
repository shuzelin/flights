class Airline
  include Mongoid::Document
  field :name, type: String

  has_many :flights
  has_many :flight_templates

  # 发布航班信息
  def publish_flight_infos(flighting_date)
    templates = self.flight_templates
    templates.each do |template|
      template.create_flight_info(flighting_date: flighting_date)
    end
  end
end
