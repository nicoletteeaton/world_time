class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :geoname_id
      t.string :country_code
      t.string :capital
      t.float :lat
      t.float :lng
    end
  end
end
