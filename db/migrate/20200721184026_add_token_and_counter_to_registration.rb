class AddTokenAndCounterToRegistration < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :referral_count, :integer
    add_column :registrations, :referral_token, :string

    commit_db_transaction
    add_reference :registrations, :parent, index: { algorithm: :concurrently }
    add_index :registrations, :referral_token, algorithm: :concurrently, unique: :true
  end
end
