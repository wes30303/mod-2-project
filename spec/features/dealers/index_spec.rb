require 'rails_helper'


  RSpec.describe 'dealers index page' do
    it "is able to order dealers by most recently created" do
      dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
      dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
      dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)

      visit '/dealers'

      within '#index-2' do
        expect(page).to have_content("shomp subaru")
        expect(page).to have_content(dealer.created_at)
      end
      within '#index-1' do
        expect(page).to have_content("Toyota")
        expect(page).to have_content(dealer.created_at)
      end
      within '#index-0' do
        expect(page).to have_content("Jeep")
        expect(page).to have_content(dealer.created_at)
      end
    end

    it "It has links to dealers index and cars index" do
      dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
      dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
      dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)

      visit '/dealers'

      expect(page).to have_link('Dealers Index')
      expect(page).to have_link('Cars Index')

    end

  end
