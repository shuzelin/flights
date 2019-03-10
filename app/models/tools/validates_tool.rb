module Tools
  module ValidatesTool
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
end
