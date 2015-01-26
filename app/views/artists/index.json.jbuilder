json.array!(@artists) do |artist|
  json.extract! artist, :id, :string, :bio
  json.url artist_url(artist, format: :json)
end
