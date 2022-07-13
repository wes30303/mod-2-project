class Car < ApplicationRecord
  belongs_to :dealer

  def self.available
    where(available: true)
  end
end
