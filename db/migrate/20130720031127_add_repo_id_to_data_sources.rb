class AddRepoIdToDataSources < ActiveRecord::Migration
  def change
    add_column :data_sources, :repo_id, :integer
  end
end
