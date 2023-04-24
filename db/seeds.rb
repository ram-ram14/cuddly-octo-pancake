# Require the HTTParty gem to make requests to the OMDB API

require 'httparty'

# Created a method to retrieve data for a given movie title from the OMDB API

def get_movie_data(title)
    # The URL for the API request
    url = "http://www.omdbapi.com/?t=#{title}&apikey=409f16f"
    # Get the response for the API request
    response = HTTParty.get(url)
    # If successful, return the JSON
    if response.success?
      return JSON.parse(response.body)
    else
        # If the response was unsuccessful raise an error message
      raise response.response
    end
  end

    # Array of movie titles to retrieve data for
    movie_titles = ['The Departed', 'Good Will Hunting', 'The Dark Knight']

    # Created a loop to iterate through the movie titles and create a new Movie record for each movie
    movie_titles.each do |title|
        # Call the get_movie_data method to retrieve data for the current movie title. 
        movie_data = get_movie_data(title)
        # Create a new movie record with data from the API
        Movie.create(
        title: movie_data['Title'],
        plot: movie_data['Plot'],
        director: movie_data['Director'],
        released_at: movie_data['Released'],
        runtime: movie_data['Runtime'],
        poster_url: movie_data['Poster']
        )
    end
