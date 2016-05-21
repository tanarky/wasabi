class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :site_id
      t.string :path
      t.string :title
      t.text :content

      t.timestamps null: false
    end
    add_index :pages, [:site_id, :path], :unique => true
  end
end
