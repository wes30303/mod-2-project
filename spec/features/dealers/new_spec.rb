require 'rails_helper'


RSpec.describe  'New Dealer Page' do

  it "has links to the new page to create a dealer" do

    visit '/dealers'
    click_link 'New Dealer'
    expect(current_path).to eq('/dealers/new')
  end

  it "can create a new dealer" do
    visit 'dealers/new'

    fill_in('Name', with: 'Lamborgni')
    fill_in('City', with: 'Las Vagas')
    fill_in('Rank', with: '5')
    fill_in('Open', with: 'true')

    click_button 'Create Dealer'
    expect(current_path).to eq('/dealers')
    expect(page).to have_content('Lamborgni')
  end
end
