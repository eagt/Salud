json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :clinic_id, :comment, :date, :creator
  json.url appointment_url(appointment, format: :json)
end
