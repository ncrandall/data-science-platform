class CreateDataActions < ActiveRecord::Migration
  def change
    create_table :data_actions do |t|
      t.string :description
      t.string :url
      t.integer :user_id
      t.integer :repo_id

      t.timestamps
    end
  end
end
