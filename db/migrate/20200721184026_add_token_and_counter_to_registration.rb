# frozen_string_literal: true

class AddTokenAndCounterToRegistration < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :referral_count, :integer
    change_column_default :registrations, :referral_count, to: 0, from: nil

    commit_db_transaction
    add_reference :registrations, :parent, type: :uuid, index: { algorithm: :concurrently }
  end
end
