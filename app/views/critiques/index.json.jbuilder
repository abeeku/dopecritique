json.array!(@critiques) do |critique|
  json.extract! critique, :id, :song, :description, :user_id
  json.url critique_url(critique, format: :json)
end
