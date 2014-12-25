module ApplicationHelper
    def current_avatar
        avatar_url = if current_user
          current_user.avatar
        else
          'unknow.git'
        end
        image_tag(avatar_url)
    end

end
