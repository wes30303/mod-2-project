require 'rails_helper'

RSpec.describe 'shows all of the dealers cars index' do

  it "will show all of the name of the cars from the dealers" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
    car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)

    visit "/dealers/#{dealer.id}/cars"

    expect(page).to have_content(car.name)
    expect(page).to have_content(car_2.name)

  end

  it "will be able to click on page" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
    car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)

    visit "/dealers/#{dealer.id}/cars"

    click_on car.name

    expect(current_path).to eq("/cars/#{car.id}")
  end
end
