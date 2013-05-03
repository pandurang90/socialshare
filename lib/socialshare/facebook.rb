require 'koala'

module Socialshare
  class Facebook
    attr_accessor :fb_token, :fb_user

    def initialize(options = {})
      @fb_token = options[:fb_token]
      @fb_user = get_fb_user(options[:fb_token])
    end
    def post(text)
      self.fb_user.put_wall_post(text)
    end

    def get_facebook_profile
      profile = self.fb_user.get_object("me")
    end

    def get_facebook_connections
      self.fb_user.get_connections("me", "friends")
    end
    
    protected 
      def get_fb_user(token)
        Koala::Facebook::API.new(token)
      end
  end
end