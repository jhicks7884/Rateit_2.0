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
     @vehicle.update(model: params[:vehicle][:model], make: params[:vehicle][:make], year: params[:vehicle][:year], style: params[:vehicle][:style],  vehicle_type: params[:vehicle][:vehicle_type])
     redirect_to vehicle_path(@vehicle)
   end

   def create
         @vehicle = Vehicle.create(vehicle_params)
      if  @vehicle.save

         redirect_to '/vehicles'
      else
         @vehicle = Vehicle.find_by_id(params[:vehicle_id]) if params[:vehicle_id]
         render :new
      end
   end

   def index
      @vehicles = Vehicle.all
   end

   def show
      @vehicle = Vehicle.find(params[:id])
   end


   def destroy
      @vehicle = Vehicle.find(params[:id])
      @vehicle.destroy
      redirect_to '/vehicles'
   end


   private

   def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :style, :model, :make, :year, :user_id)
   end
end
