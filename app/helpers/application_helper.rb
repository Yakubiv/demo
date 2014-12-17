module ApplicationHelper
	def avatar_url(user)
    	gravatar_id = Digest::MD5::hexdigest(user.email).downcase
       	"http://gravatar.com/avatar/84ce1adb94b67014236a909fa4c1269d.png?d=http%3A%2F%2Fasciicasts.com%2Fimages%2Frails.png"
  end
end
