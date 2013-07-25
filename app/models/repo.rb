class Repo < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 140 }
  validates :description, presence: true
  validate :must_have_children

  has_many :data_sources
  has_many :data_actions
  belongs_to :user

  accepts_nested_attributes_for :data_sources

  def must_have_children
    if data_sources.empty?
      errors.add(:base, 'Must have at least a data source')
    end
  end
end
