class CreatePreRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :pre_registrations do |t|
      t.string :cpf
      t.integer :bloc
      t.integer :ap

      t.timestamps
    end
  end
end
