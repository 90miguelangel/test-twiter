class Tweet < ApplicationRecord

  belongs_to :user, required: true
  validates_presence_of :text

  def author
    user
  end
end
