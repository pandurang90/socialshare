require "socialshare/version"
require "socialshare/tweeter"
require "socialshare/face_book"
require "socialshare/linkdin"

module Socialshare
  # Your code goes here...
  class Share

    def self.share(text,social_site_name,options={})
      if social_site_name=="TWITTER"
        Tweeter::TwitterConnection.new(options)
      elsif social_site_name=="FACEBOOK"
        FaceBook::FacebookConnection.new
      elsif social_site_name=="LINKEDIN"
        Linkdin::LinkedinConnection.new(options)
      end  
    end
  end

end
