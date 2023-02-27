module UsersHelper
    def current_user?(user)
     user == current_user
    end
    
    def prefecture_name(id)
        if id.present?
            Prefecture.find_by(id: id).name
        else
            "該当なし"
        end
    end
    
    def gender_name(gender)
        if gender.present?
            case gender
            when "m"
              "男性"
            when "f"
              "女性"
            when "o"
              "その他"
            else
              "該当なし1"
            end
        else
            "該当なし2"
        end
    end

    def following_check(user_id)
      users = User.where(id: current_user.followings & current_user.followers).pluck(:id)
      users.include?(user_id)
    end
end
