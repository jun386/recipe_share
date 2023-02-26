class Recipe < ApplicationRecord
    acts_as_taggable
    belongs_to :user
    has_many :likes, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    mount_uploader :image, ImagesUploader
    
    def user
        return User.find_by(id: self.user_id)
    end
    
    def self.search(search)
      if search
        Recipe.where('name LIKE ?', "%#{search}%")
      else
        Recipe.all
      end
    end
end
