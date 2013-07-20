class Repo < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 140 }
  validates :description, presence: true

  belongs_to :user
end
