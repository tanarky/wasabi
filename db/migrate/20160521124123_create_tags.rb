class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :site_id
      t.string :name

      t.timestamps null: false
    end
    add_index :tags, [:site_id, :name], :unique => true
  end
end
