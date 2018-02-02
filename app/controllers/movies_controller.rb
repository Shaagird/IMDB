class MoviesController < ApplicationController

	def index
		@movie = Movie.all
	end

 def new
  @movie = Movie.new 
 end

  def show
  	@movie = Movie.find(params[:id])
  end
	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to @movie
		else
			render 'new'
		end
	end

	private

	def movie_params
		params.require(:movie).permit(:name, :release_date, :description)
	end
end