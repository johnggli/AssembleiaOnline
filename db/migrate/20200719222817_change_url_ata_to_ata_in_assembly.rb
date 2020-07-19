class ChangeUrlAtaToAtaInAssembly < ActiveRecord::Migration[6.0]
  def change
    rename_column :assemblies, :url_ata, :ata
  end
end
