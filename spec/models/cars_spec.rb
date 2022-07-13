require 'rails_helper'

RSpec.describe Car, type: :model do
  it {should belong_to :dealer}

  it "will allow to only show cars that are available" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
    car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)
    dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
    car_3 = dealer_2.cars.create!(name: "audi", color: "yellow", year: 2017, available:true)
    dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)

    expect(Car.available).to eq([car_2, car_3])
  end

end
