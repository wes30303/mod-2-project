require 'rails_helper'

RSpec.describe 'the cars in the show page' do
  it "will show the cars and its atributes" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
    car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)
    visit "/cars/#{car.id}"
    expect(page).to have_content(car.name)


  end

  it "It has links to dealers index and cars index" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
    dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)

    visit '/cars'

    expect(page).to have_link('Dealers Index')
    expect(page).to have_link('Cars Index')

  end

  it "is able to delete a car" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)

    visit "/cars/#{car.id}"

    expect(page).to have_link('Delete Car')
    click_link 'Delete Car'
    expect(current_path).to eq('/cars')
    expect(page).to_not have_content('brz')
  end
end
