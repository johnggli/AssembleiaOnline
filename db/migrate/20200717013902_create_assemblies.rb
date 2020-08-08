class CreateAssemblies < ActiveRecord::Migration[6.0]
  def change
    create_table :assemblies do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :finish_time
      t.text :description
      t.integer :status
      t.integer :topics_count
      t.string :url_ata

      t.timestamps
    end
  end
end
