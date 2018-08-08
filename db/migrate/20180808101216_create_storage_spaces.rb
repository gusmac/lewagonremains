class CreateStorageSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :storage_spaces do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.monetize :price_cents
      t.string :photo
      t.string :address

      t.timestamps
    end
  end
end
