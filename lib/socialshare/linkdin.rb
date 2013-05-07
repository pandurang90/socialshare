require 'linkedin'

module Socialshare
  class Linkdin
    attr_accessor :api_key, :secret_key, :linkdin_user,:user_token, :user_secret

    def initialize(options = {})
      @api_key = options[:api_key]
      @secret_key = options[:secret_key]
      @user_token = options[:user_token]
      @user_secret = options[:user_secret]
      @linkdin_user = get_linkedin_user(options) 
    end

    def post(text)
      begin 
        self.linkdin_user.add_share(:comment => text) 
      rescue Exception => e
        return e
      end
    end

    def get_linkedin_profile(options = {})
      if options[:id]
        self.linkdin_user.profile(:id => options[:id])
      else
        self.linkdin_user.profile 
      end
    end

    protected 
      def get_linkedin_user(options = {})
        user = LinkedIn::Client.new(options[:api_key], options[:secret_key])
        user.authorize_from_access(options[:user_token], options[:user_secret])
        user
      end
  end
end


