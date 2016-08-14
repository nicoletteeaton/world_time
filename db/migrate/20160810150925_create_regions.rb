class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.integer :country_id
      t.integer :geoname_id
      t.string :name
      t.float :lat
      t.float :lng

      t.index :country_id
    end
  end
end
