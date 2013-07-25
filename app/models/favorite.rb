class Favorite < ActiveRecord::Base
  validates :data_action_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :data_action
end
