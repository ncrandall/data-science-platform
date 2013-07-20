class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.text :description
      t.text :schema
      t.integer :parent_id
      t.boolean :public
      t.integer :num_rows
      t.float :size

      t.timestamps
    end
  end
end
