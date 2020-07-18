class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :search, :string
    add_column :users, :role, :integer, :default => 0
    add_column :users, :paid, :boolean, :default => true
    add_reference :users, :pre_registration, null: false, foreign_key: true
  end
end
