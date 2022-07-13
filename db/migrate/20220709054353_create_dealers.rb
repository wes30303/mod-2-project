class CreateDealers < ActiveRecord::Migration[5.2]
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :city
      t.integer :rank
      t.boolean :open
      t.timestamps
    end
  end
end
