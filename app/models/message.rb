class Message < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: 'user_id'
    belongs_to :room
    
    def user
        return User.find_by(id: self.sender_id)
    end
end
