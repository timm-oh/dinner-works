class AddPositionToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :position, :integer
    change_column_default :products, :position, 0
    commit_db_transaction
    Product.update_all(position: 0)
  end
end
