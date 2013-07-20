class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|

      t.timestamps
    end
  end
end
