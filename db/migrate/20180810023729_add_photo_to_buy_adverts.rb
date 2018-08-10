class AddPhotoToBuyAdverts < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_adverts, :photo, :string
  end
end
