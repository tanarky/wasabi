class CreateBinaries < ActiveRecord::Migration
  def change
    create_table :binaries do |t|
      t.integer :site_id
      t.string :content_type
      t.integer :size
      t.string :name
      t.binary :data, :limit => 300.megabyte

      t.timestamps null: false
    end
    add_index :binaries, [:site_id, :name], :unique => true
  end
end
