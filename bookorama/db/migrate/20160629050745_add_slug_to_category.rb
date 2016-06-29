class AddSlugToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
  end

  def down
    remove_index :categories, :slug, unique: true
    remove_column :categories, :slug, :string
  end
end
