class CreateServices < ActiveRecord::Migration[8.0]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :duration
      t.decimal :price

      t.timestamps
    end
  end
end
