class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :color
      t.integer :year
      t.boolean :available
      t.timestamps
    end
  end
end
