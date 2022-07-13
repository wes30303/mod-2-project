class DealersController < ApplicationController
  def index
    @dealers = Dealer.all
  end

  def show
    @dealer = Dealer.find(params[:id])
  end

  def new

  end

  def create
    dealer = Dealer.create(name: params[:name],
                          city: params[:city],
                          rank: params[:rank],
                          open: params[:open])
    redirect_to "/dealers"
  end
   
  def edit
    @dealer = Dealer.find(params[:id])
  end

  def update
    dealer = Dealer.find(params[:id])
     dealer.update(name: params[:name],
                          city: params[:city],
                          rank: params[:rank],
                          open: params[:open])
    redirect_to "/dealers/#{dealer.id}"
  end

  def destroy
    dealer = Dealer.find(params[:id])
    dealer.destroy
    redirect_to '/dealers'
  end
end
