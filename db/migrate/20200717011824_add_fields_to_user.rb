class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :role, :integer
    add_column :users, :paid, :boolean
    add_reference :users, :pre_registration, null: false, foreign_key: true
  end
end
