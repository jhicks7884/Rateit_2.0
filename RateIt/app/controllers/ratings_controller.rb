class RatingsController < ApplicationController
    
    def new
      @rating = Rating.new
    end
    def index
    #  @ = .scoped
    end

    def show
    #  @ = .find(params[:id])
    end

    def create
      @rating = current_user.ratings.create(rating_params)
      #byebug

      redirect_to '/ratings'
    end

    def update
    #  @rating = Rating.find(params[:id])
    end

    def edit
    #  @ = .find(params[:id])
    end
    
    def destroy
    #   = .find(params[:id])
    end

    private

    def rating_params
      params.require(:rating).permit(:vehicle_ratings, :user_id, :vehicle_id)
    end
end



