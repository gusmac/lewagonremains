class AddReferencesToSellAdverts < ActiveRecord::Migration[5.2]
  def change
    add_reference :sell_adverts, :category
  end
end
