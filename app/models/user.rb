class User < ActiveRecord::Base
  # virtual login parameter
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true, length: { in: 6..20 }
  validates :email, presence: true

  has_many :repos
  has_many :data_actions
  has_many :favorites

  def full_name
    "#{first_name} #{last_name}"
  end

  # Override Devise default login to allow username or email
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def favorited?(data_action_id)
    !favorite(data_action_id).nil? 
  end

  def favorite(data_action_id)
    favorites.where(data_action_id: data_action_id).first
  end
end
