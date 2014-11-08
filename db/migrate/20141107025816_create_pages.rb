class CreatePages < ActiveRecord::Migration
    def change
        create_table :pages do |t|
            #same as: t.references :subject (foreign key reference)
            t.integer "subject_id"
            t.string "name"
            t.string "permalink"
            t.boolean "visible", :default => false
            t.integer "position"
            t.timestamps
        end
        #adding indexes
        add_index("pages", "subject_id")
        add_index("pages", "permalink")
    end

    def down
        drop_table :pages
    end
end
