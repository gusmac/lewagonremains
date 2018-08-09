class CreateSellAdverts < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_adverts do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.monetize :price
      t.string :photo
      t.string :address
      t.string :condition
      t.references :category, foreign_key: true
      t.references :storage_space, foreign_key: true

      t.timestamps
    end
  end
end
