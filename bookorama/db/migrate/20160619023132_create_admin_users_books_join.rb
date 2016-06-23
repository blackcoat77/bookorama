class CreateAdminUsersBooksJoin < ActiveRecord::Migration
  def up
    create_table :admin_users_books, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "book_id"
    end
    add_index :admin_users_books, ["admin_user_id", "book_id"]
  end

  def down
    drop_table :admin_users_books
  end

end
