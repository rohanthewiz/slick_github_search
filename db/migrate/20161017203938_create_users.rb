class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false, index: true
      t.string :uid, null: false, index: true
      t.string :name
      t.string :location
      t.string :image_url
      t.string :url
      t.timestamps null: false

    end
    add_index :users, [:provider, :uid], unique: true
  end
end
