class CreateBooks < ActiveRecord::Migration
    def up
        create_table :books do |t|
            t.integer 'category_id', index: true
            t.string 'isbn', limit: 13, null: false
            t.string 'author', limit: 80
            t.string 'title', limit: 100
            t.decimal 'price', precision: 5, scale: 2, null: false
            t.boolean 'visible', default: false
            t.string 'description'

            t.timestamps null: false
        end
        add_index :books, :isbn, unique: true
    end

    def down
        drop_table :books
    end
end
