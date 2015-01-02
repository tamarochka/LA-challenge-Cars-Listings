class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
   if @car.save
      redirect_to cars_path, notice: "New car was successfully added"
    else
      render :new
    end
  end

  def index
    @cars = Car.all
  end


  private

  def car_params
    params.require(:car).permit(:year, :mileage, :color, :description, :manufacturer_id)
  end

end
