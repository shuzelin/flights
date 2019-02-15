json.extract! flight_info, :id, :filght_number, :from_city, :to_city, :airline_id, :sched, :created_at, :updated_at
json.url flight_info_url(flight_info, format: :json)
