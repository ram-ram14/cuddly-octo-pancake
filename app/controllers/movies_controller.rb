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
        m = Movie.find_or_create_by :title => movie['Title'], :poster_image => movie['Poster']
        @movies << m 
      end
    else
      @movies = []
    end 
  end

  def show
    url = URI("https://www.omdbapi.com/?i=#{params[:id]}&apikey=#{ENV['409f16f']}")
    res = Net::HTTP.get(url)
    @movie = JSON.parse(res)
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end
