class CreateCategories < ActiveRecord::Migration
    def up
        create_table :categories do |t|
            t.string 'category_name', null: false
            t.boolean 'visible', default: false

            t.timestamps null: true
        end
    end

    def down
        drop_table :categories
    end
end
