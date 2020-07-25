# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false
      t.monetize :cost
      t.string :description
      t.belongs_to :store, type: :uuid
      t.timestamps
    end
  end
end
