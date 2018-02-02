class ActorsController < ApplicationController
	
	def index
    @actor = Actor.all
	end
	def new
	end
	def show
		@actor = Actor.find(params[:id])
	end

	def create
		@actor = Actor.create(actor_params)

		redirect_to @actor
	end

	def update
		@actor = Actor.find(params[:id])
		
	end

	private
	def actor_params
		params.require(:actor).permit(:name, :dob)
	end
end
