json.extract! song, :id, :upload_song, :created_at, :updated_at
json.url song_url(song, format: :json)
