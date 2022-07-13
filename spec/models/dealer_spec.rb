require 'rails_helper'

RSpec.describe Dealer do
  it {should have_many :cars}

  describe 'class methods' do
    it "list dealers by most when they most recently created" do
      dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
      dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
      dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)
      expect(Dealer.most_recently_created).to eq([dealer_3, dealer_2, dealer])
    end

  end

  describe 'instance methods' do
    it "is able to show the amount of cars in the dealer" do
      dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
      car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
      car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)
      dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
      car_3 = dealer_2.cars.create!(name: "audi", color: "yellow", year: 2017, available:false)
      dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)

      expect(dealer.car_count).to eq(2)
      expect(dealer_2.car_count).to eq(1)
      expect(dealer_3.car_count).to eq(0)
    end
  end
end
