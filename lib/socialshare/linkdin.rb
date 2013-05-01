module Linkdin
  class LinkedinConnection
    attr_accessor :api_key, :secret_key, :linkdin_user

    def initialize(options = {})
      @api_key = options[:api_key]
      @secret_key = options[:secret_key]
      @linkdin_user = get_linkedin_user(options) 
    end

    def post(text)
      self.linkdin_user.update_status(text) 
    end

    def get_linkedin_profile(options = {})
      if options[:id].present?
        self.linkdin_user.profile(:id => options[:id])
      else
        self.linkdin_user.profile 
      end
    end

    protected 
      def get_linkedin_user(options = {})
        user = LinkedIn::Client.new(options[:api_key], options[:secret_key])
        user.authorize_from_access(options[:token], options[:secret])
        user
      end
  end
end