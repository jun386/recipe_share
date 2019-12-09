class Recipe < ApplicationRecord
    acts_as_taggable
    belongs_to :user
    has_many :likes
    has_many :comments, :dependent => :destroy
    mount_uploaders :images, ImagesUploader
    serialize :images, JSON
    
    def user
        return User.find_by(id: self.user_id)
    end
    
    def self.search(search)
      if search
        Post.where(['content LIKE ?', "%#{search}%"])
      else
        Post.all
      end
    end
end
