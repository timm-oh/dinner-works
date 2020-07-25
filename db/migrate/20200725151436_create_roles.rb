class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles, id: :uuid do |t|
      t.belongs_to :user, foreign_key: true, type: :uuid
      t.belongs_to :store, null: false, foreign_key: true, type: :uuid
      t.uuid :invited_by_id, null: false, type: :uuid
      t.string :email, null: false

      t.timestamps
    end
  end
end
