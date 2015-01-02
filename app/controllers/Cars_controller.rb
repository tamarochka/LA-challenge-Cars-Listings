class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find_by(name: params["car"][:manufacturer_id])

    if (@manufacturer != nil)
      @car.manufacturer_id = @manufacturer.id  
    end

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
    params.require(:car).permit(:year, :mileage, :color, :description)
  end

end
