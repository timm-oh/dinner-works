# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores, id: :uuid do |t|
      t.string :name, null: false
      t.string :location, null: false

      t.timestamps
    end
    add_index :stores, :name, unique: true
  end
end
