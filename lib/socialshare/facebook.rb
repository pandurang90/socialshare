require 'koala'

module Socialshare
  class Facebook
    attr_accessor :fb_token, :fb_user

    def initialize(options = {})
      @fb_token = options[:fb_token]
      @fb_user = get_fb_user(options[:fb_token])
    end
    def post(text)
      begin
        self.fb_user.put_wall_post(text)
      rescue Exception => e
        return e
      end
    end

    def get_facebook_profile
      begin
        profile = self.fb_user.get_object("me")
      rescue Exception => e
        return e
      end
    end

    def get_facebook_connections
      begin
        self.fb_user.get_connections("me", "friends")
      rescue Exception => e
        return e
      end
    end

    def share_picture(file_path)
      begin
        self.fb_user.put_picture(File.open(file_path))
      rescue Exception => e
        return e
      end
    end

    def share_video(file_path)
      begin
        self.fb_user.put_video(File.open(file_path))
      rescue Exception => e
        return e
      end
    end
    
    protected 
      def get_fb_user(token)
        Koala::Facebook::API.new(token)
      end
  end
end