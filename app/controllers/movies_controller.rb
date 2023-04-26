class MoviesController < ApplicationController
      def index
        @q = Movie.ransack(params[:q])
        @movies = @q.result(distinct: true).includes(:reviews).order(:title).page(params[:page])
      end  
  
      def new
        @movie = Movie.new
      end

      def create
        movie = Movie.create movie_params
        if params[:file].present?
          req = Cloudinary::Uploader.upload(params[:file])
          work.image = req["public_id"]
          work.save
        end
        redirect_to work 
        @current_user.movies << movie

        review = Review.create(user: @current_user, movie: movie)
        redirect_to root_path
      end     

      def show
        @movie = Movie.find(params[:id])
        @reviews = @movie.reviews
      end
      
      def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
      
        redirect_to movies_path
      end
      
      private
      def movie_params
        params.require(:movie).permit(:title)
      end
end
