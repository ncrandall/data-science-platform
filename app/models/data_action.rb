class DataAction < ActiveRecord::Base
  validates :repo_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :url, presence: true

  has_many :favorites
  belongs_to :user
  belongs_to :repo
end
