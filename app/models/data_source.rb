class DataSource < ActiveRecord::Base
  has_attached_file :source

  validates_attachment :source, attachment_presence: true, 
    size: { :in => 0..10.megabytes }, content_type: { content_type: "text/csv" }

  belongs_to :repo

  after_save :get_rows_from_file

  def self.records_count
    cnt = 0
    DataSource.all.each do |ds|
      cnt += ds.rows
    end
    cnt
  end

  def get_rows_from_file
    url = source.url
    url = source.path if Rails.env != 'production'
    f = open(url)
    cnt = 0

    f.each do |l|
      cnt += 1
    end

    if cnt != rows
      self.update_attribute(:rows, cnt)
    end
  end
end
