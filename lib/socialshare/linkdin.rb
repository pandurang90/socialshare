module Linkdin
  class LinkedinConnection
    
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
        user = LinkedIn::Client.new(LINKEDIN_API_KEY, LINKEDIN_SECRET_KEY)
        user.authorize_from_access(options[:token], options[:secret]) if user.present?  
      end

  end
end