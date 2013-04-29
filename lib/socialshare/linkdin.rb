module Linkdin
  class LinkedinConnection
    attr_accessor :api_key, :secret_key
    def initialize(options)
      api_key = options["api_key"]
      secret_key = options["secret_key"]
    end

    def post(text,options)
      user = get_linkedin_user(options) 
      user.add_share(:comment => text) if user.present?
    end

    def get_linkedin_profile(options)
      user = get_linkedin_user(options) 
      if user.present?
        if options["id"].present?
          user.profile(:id => options["id"])
        else
          user.profile 
        end
      end
    end

    protected 
      def get_linkedin_user(options)
        user = LinkedIn::Client.new(self.api_key, self.secret_key)
        user.authorize_from_access(options[:token], options[:secret]) if user.present?  
      end
  end
end