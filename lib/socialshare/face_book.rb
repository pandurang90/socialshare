module FaceBook
  class FacebookConnection
    def post(text,options)
      user = get_fb_user(options[:fb_token])
      user.put_wall_post(text) if user.present?
    end

    def get_facebook_profile(options)
      user = get_fb_user(options[:fb_token])
      profile = user.get_object("me") if user.present?
    end

    def get_facebook_connections(options)
      user = get_fb_user(options[:fb_token])
      user.get_connections("me", "friends") if user.present?
    end
    
    protected 
      def get_fb_user(token)
        Koala::Facebook::API.new(token)
      end
  end
end