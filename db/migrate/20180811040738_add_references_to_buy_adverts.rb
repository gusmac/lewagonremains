class AddReferencesToBuyAdverts < ActiveRecord::Migration[5.2]
  def change
    add_reference :buy_adverts, :category
  end
end
