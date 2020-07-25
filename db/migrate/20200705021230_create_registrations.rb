# frozen_string_literal: true

class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations, id: :uuid do |t|
      t.string :email

      t.timestamps
    end
    add_index :registrations, :email, unique: true
  end
end
