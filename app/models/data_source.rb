class DataSource < ActiveRecord::Base
  has_attached_file :source

  validates_attachment :source, attachment_presence: true, 
    size: { :in => 0..10.megabytes }, content_type: { content_type: "text/xml" }

  belongs_to :repo
end
