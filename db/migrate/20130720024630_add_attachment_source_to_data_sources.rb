class AddAttachmentSourceToDataSources < ActiveRecord::Migration
  def self.up
    change_table :data_sources do |t|
      t.attachment :source
    end
  end

  def self.down
    drop_attached_file :data_sources, :source
  end
end
