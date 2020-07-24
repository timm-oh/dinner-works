class AddLastVisitedStoreToUser < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :users, :last_visited_store, type: :uuid, index: { algorithm: :concurrently }
  end
end
