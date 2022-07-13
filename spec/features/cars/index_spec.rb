require 'rails_helper'

RSpec.describe 'Cars Index page' do

  it "will only show cars thats are available" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
    car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)
    dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
    car_3 = dealer_2.cars.create!(name: "audi", color: "yellow", year: 2017, available:true)
    dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)

    visit '/cars'
    expect(page).to have_content('wrx')
    expect(page).to have_content('audi')
    expect(page).to_not have_content('brz')
  end

  it "has a link to update cars" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
    dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
    car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)
    visit '/cars'

    expect(page).to have_link('Update Cars')

  end

  it "is able to delete" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:true)
    visit '/cars'

      expect(page).to have_link("Delete Car")
      click_link 'Delete Car'

    expect(page).to_not have_content('brz')
  end

end
