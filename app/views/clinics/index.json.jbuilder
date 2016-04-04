json.array!(@clinics) do |clinic|
  json.extract! clinic, :id, :creator
  json.url clinic_url(clinic, format: :json)
end
