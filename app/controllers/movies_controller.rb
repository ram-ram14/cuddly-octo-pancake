class MoviesController < ApplicationController
      def index
        @movies = Movie.all
      end
      
      def new
        @movie = Movie.new
      end

      def create
        movie = Movie.create movie_params
        @current_user.movies << movie

        redirect_to root_path
      end      
      
      private
      def movie_params
        params.require(:movie).permit(:title)
      end
end
