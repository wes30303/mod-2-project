require 'rails_helper'

RSpec.describe 'dealers show page' do


  it 'will show the amount of cars in the dealership ' do
  dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
  car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
  car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)
  dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
  car_3 = dealer_2.cars.create!(name: "audi", color: "yellow", year: 2017, available:false)
  dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)
  visit "/dealers/#{dealer.id}"
  expect(page).to have_content("Number of Cars in dealer: 2")

  visit "/dealers/#{dealer_2.id}"
  expect(page).to have_content(1)

  end

  it "It has links to dealers index and cars index" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
    dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)

    visit "/dealers/#{dealer_2.id}"

    expect(page).to have_link('Dealers Index')
    expect(page).to have_link('Cars Index')

  end


  it "has a link at dealers id that will take them to dealers cars" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
    car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)
    dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
    car_3 = dealer_2.cars.create!(name: "audi", color: "yellow", year: 2017, available:false)
    dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)

    visit "/dealers/#{dealer.id}"

    expect(page).to have_link("Dealers Cars Index")
    click_link "Dealers Cars Index"
    expect(current_path).to eq("/dealers/#{dealer.id}/cars")
  end

end
