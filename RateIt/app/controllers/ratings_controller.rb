class RatingsController < ApplicationController
    
    def new
      @rating = Rating.new
    end
    def index
    #  @ = .scoped
    end

    def show
      @rating = current_user.ratings
    end

    def create
      if logged_in?
       @rating = current_user.ratings.create(rating_params)
       @rating.save!
       
       redirect_to '/ratings/show'
      else
        redirect_to '/logout'
      end
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
      params.require(:rating).permit(:vehicle_ratings, :vehicle_id)
    end
end



