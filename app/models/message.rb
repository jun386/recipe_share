class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: 'user_id'
  belongs_to :room

  def user
    User.find_by(id: user_id)
  end
end
