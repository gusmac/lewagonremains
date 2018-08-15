class AddBatchNoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :batch_no, :integer
  end
end
