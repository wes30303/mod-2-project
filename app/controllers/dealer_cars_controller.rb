class DealerCarsController < ApplicationController


  def index
    @dealer = Dealer.find(params[:id])
    @cars = @dealer.cars

  end

  def new
    @dealer = Dealer.find(params[:id])
    @cars = @dealer.cars
  end

  def create
    dealer = Dealer.find(params[:id])
    car = dealer.cars.create(name: params[:name],
                          color: params[:color],
                          year: params[:year],
                          available: params[:available])
    redirect_to "/dealers/#{dealer.id}/cars"
  end
end
