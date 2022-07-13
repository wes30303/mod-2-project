require 'rails_helper'
RSpec.describe  'Edit Dealer Page' do

  it "has links to the new page to create a dealer" do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)

    visit "/dealers/#{dealer.id}"
    click_link 'Update Dealer'
    expect(current_path).to eq("/dealers/#{dealer.id}/edit")
  end

  it "has a from to edit " do
    dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)

    visit "/dealers/#{dealer.id}/edit"

    fill_in('Name', with: 'Lamborgni')
    fill_in('City', with: 'Denver')
    fill_in('Rank', with: '5')
    fill_in('Open', with: 'true')

    click_button 'Update Dealer'

    expect(current_path).to eq("/dealers/#{dealer.id}")
    expect(page).to have_content("Denver")


  end
end
