class DataSource < ActiveRecord::Base
  has_attached_file :source

  validates_attachment :source, attachment_presence: true, 
    size: { :in => 0..10.megabytes }

  belongs_to :repo
end
