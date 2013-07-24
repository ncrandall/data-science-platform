class RemoveNumRowsSizeFromRepos < ActiveRecord::Migration
  def change
    remove_column :repos, :num_rows, :string
    remove_column :repos, :size, :string
    add_column :data_sources, :rows, :integer
    change_column :repos, :public, :boolean, default: true
  end
end
