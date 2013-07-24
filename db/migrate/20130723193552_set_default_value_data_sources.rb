class SetDefaultValueDataSources < ActiveRecord::Migration
  def change
    change_column :data_sources, :rows, :integer, default: 0
  end
end
