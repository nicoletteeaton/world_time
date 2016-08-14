class CreateUserSelections < ActiveRecord::Migration
  def change
    create_table :user_selections do |t|
      t.integer :user_id
      t.integer :country_id
      t.integer :region_id

      t.timestamps
    end
  end
end
