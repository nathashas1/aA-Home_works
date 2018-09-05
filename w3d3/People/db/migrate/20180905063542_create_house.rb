class CreateHouse < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :people_id
      t.timestamps
    end
  end
end
