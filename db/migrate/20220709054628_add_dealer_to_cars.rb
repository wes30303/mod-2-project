class AddDealerToCars < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :dealer, foreign_key: true
  end
end
