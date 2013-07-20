class Repo < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 140 }
  validates :description, presence: true

  has_many :data_sources
  belongs_to :user

  accepts_nested_attributes_for :data_sources
end
