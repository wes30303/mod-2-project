class Dealer < ApplicationRecord
  has_many :cars, dependent: :destroy

  def self.most_recently_created
    order(created_at: :desc)
  end

  def car_count
    cars.count
  end

end
