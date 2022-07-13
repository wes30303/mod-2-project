require 'rails_helper'
RSpec.describe  'Create a new car' do

  it "links to the new cars index" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)

    visit "/dealers/#{dealer.id}/cars"

    click_link 'Create Car'

    expect(current_path).to eq("/dealers/#{dealer.id}/cars/new")

  end

  it "links to the new cars index" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)

    visit "/dealers/#{dealer.id}/cars/new"


    fill_in('Name', with: 'STI')
    fill_in('Color', with: 'red')
    fill_in('Year', with: '2020')
    fill_in('Available', with: 'true')
    click_button 'Create Car'

    expect(current_path).to eq("/dealers/#{dealer.id}/cars")
    expect(page).to have_content('STI')

  end
end
