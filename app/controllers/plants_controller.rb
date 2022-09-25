class PlantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound , with: :error_response
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_plant
    render json: plant
  end
  # UPDATE 
  def update
    plant = find_plant
    plant.update(plant_params)
    render json: plant

  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end
  # DELETE plant
  def destroy
    plant = find_plant
    plant.destroy
  end

  private
  def find_plant
    Plant.find(params[:id])
  end

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
    
  def error_response
    render json: { error: "Plant not found"}, status: :not_found
    end



end
