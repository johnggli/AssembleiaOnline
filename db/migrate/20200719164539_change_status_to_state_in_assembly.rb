class ChangeStatusToStateInAssembly < ActiveRecord::Migration[6.0]
  def change
    rename_column :assemblies, :status, :state
  end
end
