class Relationship < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :follower, class_name: 'User', required: true
  validates_uniqueness_of :user_id, :scope => :follower_id, 
                        message: 'Already following'
  validate :user_can_not_follow_himself

  private

  def user_can_not_follow_himself
    return unless user_id == follower_id
    errors.add(:user_id, 'can not follow himself')
  end
end
