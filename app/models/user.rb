class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :following, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, class_name: 'Relationship', foreign_key: 'user_id', dependent: :destroy
  has_many :tweets

  def self.jwt_revoked?(payload, user)
    false
  end

  def self.revoke_jwt(payload, user)
    # Does something to revoke the JWT token for given user
  end
end
