class VehiclesController < ApplicationController

   def new
      @vehicle = Vehicle.new
   end

   def edit
    @vehicle = Vehicle.find(params[:id])

   end

   def update
     #raise params.inspect
     @vehicle = Vehicle.find(params[:id])
     @vehicle.update(model: params[:vehicle][:model], make: params[:vehicle][:make], year: params[:vehicle][:year], style: params[:vehicle][:style])
     redirect_to vehicle_path(@vehicle)
   end

   def create
      if logged_in?
         #Vehicle.find_by(vehicle_type: params[:vehicle_type])
         @vehicle = Vehicle.create(vehicle_params)
         redirect_to '/ratings/new'
      else
         redirect_to '/logout'
      end
   end

   def index
      @vehicles = current_user.vehicles
   end


   def destroy
      @vehicle.destroy
   end


   private

   def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :style, :model, :make, :year, :user_id)
   end
end
