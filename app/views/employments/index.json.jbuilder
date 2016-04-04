json.array!(@employments) do |employment|
  json.extract! employment, :id, :professional_id, :clinic_id, :creator
  json.url employment_url(employment, format: :json)
end
