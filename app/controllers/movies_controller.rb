class MoviesController < ApplicationController

	def index
		@movie = Movie.all.select("id, name, release_date, description")
	end

 def new
  @movie = Movie.new 
 end

  def show
  	@movie = Movie.find(params[:id])
  	@actors = @movie.actors
  end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to @movie
		else
			render 'new'
		end
	end
  def destroy
  	@movie = Movie.find(params[:id])
  	@movie.destroy
  	redirect_to movies_path
  end
	private

	def movie_params
		params.require(:movie).permit(:name, :release_date, :description)
	end
end
