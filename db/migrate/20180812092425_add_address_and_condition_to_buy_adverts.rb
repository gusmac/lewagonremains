class AddAddressAndConditionToBuyAdverts < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_adverts, :address, :string
    add_column :buy_adverts, :condition, :string
  end
end
