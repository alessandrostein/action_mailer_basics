json.array!(@emails) do |email|
  json.extract! email, :id, :to, :subject
  json.url email_url(email, format: :json)
end
