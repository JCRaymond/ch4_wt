# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
	
	def index
		@movies = Movie.all
	end

    def show
        id = params[:id]
        @movie= Movie.find(id)
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.create!(movie_params)
        flash[:notice] = "#{@movie.title} was successfully created."
        redirect_to movies_path
    end

    def edit
        @movie = Movie.find params[:id]
    end

    def update
        @movie = Movie.find params[:id]
        @movie.update_attributes!(movie_params)
        flash[:notice] = "#{@movie.title} was successfully updated"
        redirect_to movie_path(@movie)
    end

    private
    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end

end
