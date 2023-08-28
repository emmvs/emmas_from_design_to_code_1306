puts "Cleaning DB 🧼"
Movie.destroy_all

puts "Creating movies! 🎥 🎥 🎥"
movies = [
  "barbie",
  "oppenheimer"
]

movies.each do |movie|
  omdb_endpoint = "http://www.omdbapi.com/?s=#{movie}&apikey=a881ace5"

  serialized_data = URI.parse(omdb_endpoint).open.read
  results = JSON.parse(serialized_data)["Search"]

  results.each do |result|
    next if result["Type"] != "movie" || result["Poster"] == "N/A"

    Movie.create(title: result["Title"], year: result["Year"].to_i, image_url: result["Poster"])
  end
end

puts "Done! 🪄"
