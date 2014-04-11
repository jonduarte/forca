json.array!(@games) do |game|
  json.extract! game, :id, :chances, :word
  json.url game_url(game, format: :json)
end
