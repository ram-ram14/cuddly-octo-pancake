# Child class of ApplicanController
# It involves some methods that handle movie actions i.e. searching for movies, displaying movies and adding reviews.
class MoviesController < ApplicationController
  require 'net/http'
  require 'json'
  
  # New method for when a user wants to add a movie
  # Assigns a new movie object to an instance variable @movie.
  def new
    @movie = Movie.new
  end
  
  # New method when a user wants to search for a movie. 
  # It searches for movies using the Open Movie Database (OMDb) API and assigns the results to an instance variable @movies.
  def index
    if params[:search].present?
      # Creates a url to search for a particular movie.
      url = URI("https://www.omdbapi.com/?s=#{params[:search]}&apikey=409f16f")
      # Get a response from the API
      res = Net::HTTP.get(url)
      # Parse the response to get a list of movies
      movies = JSON.parse(res)['Search']
      @movies = []
      movies.each do |movie|
      # Same as before but this time it is to get the details of a movie
        url = URI("https://www.omdbapi.com/?apikey=409f16f&t=#{CGI.escape(movie['Title'])}")
        # Get a response from the API
        res = Net::HTTP.get(url)
        # Same as before
        movie_details = JSON.parse(res)
        # Find or create a movie in the database based on the details obtained from the API
        m = Movie.find_or_create_by(
          title: movie_details['Title'],
          poster_image: movie_details['Poster'],
          plot: movie_details['Plot'],
          director: movie_details['Director'],
          release_date: movie_details['Released'],
          runtime: movie_details['Runtime']
        )
        @movies << m 
      end
      # Limited the display result to 1 movie. 
      @movies = Movie.where(id: @movies.map(&:id)).limit(1)
    else
      # If there is no search query, assign an empty array. 
      @movies = []
    end 
  end

  # New method for when a user wants to see the details of a movie. 
  # It finds the movie in the database based on the id parameter and assigns it to an instance variable @movie.
  def show
    @movie = Movie.find(params[:id])
  end

  # New method for when a user wants to add a review for a movie. 
  def add_review
    # It finds the movie in the database based on the id parameter and assigns it to an instance variable @movie.
    @movie = Movie.find(params[:id])
    # It also retrieves the reviews for the movie and assigns them to an instance variable @reviews.
    @reviews = @movie.reviews
    @review = Review.new
    # If there are no reviews for the movie, it sets the @show_add_review_button to true.
    if @reviews.empty?
      @show_add_review_button = true
    end
    @movie_title = @movie.title
  end
  
  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end
