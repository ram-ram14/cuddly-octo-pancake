class MoviesController < ApplicationController
  require 'net/http'
  require 'json'
  
  def new
    @movie = Movie.new
  end
  
  def index
    if params[:search].present?
      url = URI("https://www.omdbapi.com/?s=#{params[:search]}&apikey=409f16f")
      res = Net::HTTP.get(url)
      movies = JSON.parse(res)['Search']
      @movies = []
      movies.each do |movie|
        url = URI("https://www.omdbapi.com/?apikey=409f16f&t=#{CGI.escape(movie['Title'])}")
        res = Net::HTTP.get(url)
        movie_details = JSON.parse(res)
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
      @movies = Movie.where(id: @movies.map(&:id)).limit(1)
    else
      @movies = []
    end 
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def add_review
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
    @review = Review.new
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
