class CreateBrandsAndStores < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :stores do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :brands_stores, id: false do |t|
      t.belongs_to :brand, index: true
      t.belongs_to :store, index: true
    end
  end
end
