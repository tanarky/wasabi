class Page < ActiveRecord::Migration
  def change
    rename_column :pages, :path, :name
  end
end
