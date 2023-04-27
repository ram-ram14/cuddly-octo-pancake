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
      puts movies
      @movies = []
      movies.each do |movie|
        puts 'hello'
        puts movie 
        m = Movie.find_or_create_by(:title => movie['Title'], :poster_image => movie['Poster'], :plot => movie['Plot'], :director => movie["Director"], :release_date => movie["Released"], :runtime => movie["Runtime"])
        @movies << m 
      end
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
