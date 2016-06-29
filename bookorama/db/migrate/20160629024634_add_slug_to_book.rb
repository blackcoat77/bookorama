class AddSlugToBook < ActiveRecord::Migration
  def up
    add_column :books, :slug, :string
    add_index :books, :slug, unique: true
  end

  def down
    remove_index :books, :slug, unique: true
    remove_column :books, :slug, :string
  end
end
