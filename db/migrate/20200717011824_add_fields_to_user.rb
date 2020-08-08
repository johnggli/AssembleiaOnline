class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :role, :integer
    add_column :users, :bloc, :integer
    add_column :users, :ap, :integer
    add_column :users, :cpf, :string
    add_column :users, :paid, :boolean, default: :true
    add_reference :users, :pre_registration, null: false, foreign_key: true
  end
end
