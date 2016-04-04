json.array!(@assaigments) do |assaigment|
  json.extract! assaigment, :id, :appointment_id, :professional_id, :creator
  json.url assaigment_url(assaigment, format: :json)
end
