class CarsController < ApplicationController
  def index
    @cars = Car.available
  end

  def show
    @cars = Car.find(params[:id])
  end

  def edit
    @cars = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
     car.update(name: params[:name],
                          color: params[:color],
                          year: params[:year],
                          available: params[:available])
    redirect_to "/cars/#{car.id}"
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to '/cars'
  end

end
