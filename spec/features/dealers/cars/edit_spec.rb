require 'rails_helper'

RSpec.describe 'Edit childs index' do


  it "has links to the new page to create a dealer" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
    visit "/cars/#{car.id}"
    click_link 'Update Car'
    expect(current_path).to eq("/cars/#{car.id}/edit")
  end

  it "has a from to edit " do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
    car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)

    visit "/cars/#{car.id}/edit"

    fill_in('Name', with: 'Pikachu')
    fill_in('Color', with: 'Yellow')
    fill_in('Year', with: '2017')
    fill_in('available', with: 'false')
    click_button 'Update Car'

    expect(current_path).to eq("/cars/#{car.id}")
    expect(page).to have_content("Pikachu")


  end
end
