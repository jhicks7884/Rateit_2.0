class RatingsController < ApplicationController
    
    def new
      @rating = Rating.new
      @rating.build_vehicle
      if params[:vehicle_id] && @vehicle = Vehicle.find_by_id(params[:vehicle_id])
        @rating = @vehicle.ratings.build
      else
        @rating = Rating.new
        @rating.build_vehicle
      end
    end

    def index
      #@ratings = Rating
      if  params[:vehicle_id] && @vehicle = Vehicle.find_by_id(params[:vehicle_id])
       @ratings = @vehicle.ratings
      else
        @ratings = Rating.all
      end
    end

    def show
      @rating = current_user.ratings
    end

    def create
      if logged_in?
        @rating = current_user.ratings.create(rating_params)
        @rating.save
       redirect_to  '/vehicles'
      else
        render :new
      end
    end

    def update
      @rating = Rating.find(params[:id])
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



