class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturers_path, notice: "New manufacturer was successfully added"
    else
      render :new
    end
  end

  def index
    @manufacturers = Manufacturer.all
  end


  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end

end
