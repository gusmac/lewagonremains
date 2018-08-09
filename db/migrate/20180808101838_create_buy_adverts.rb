class CreateBuyAdverts < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_adverts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.monetize :price_cents

      t.timestamps
    end
  end
end
