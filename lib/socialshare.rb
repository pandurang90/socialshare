require "socialshare/version"
require "socialshare/tweeter"
require "socialshare/face_book"
require "socialshare/linkdin"

module Socialshare
  # Your code goes here...
  def self.share(text,social_site_name,options={})
    if social_site_name=="TWITTER"
      share_on_twitter(text,options)
    elsif social_site_name=="FACEBOOK"
      share_on_facebook(text,options)
    elsif social_site_name=="LINKEDIN"
      share_on_linkedin(text,options)
    end  
  end

  def share_on_twitter(text,options)
    twitter_connection = Tweeter::TwitterConnection.new
    twitter_connection.post(text,options)
  end

  def share_on_facebook(text,options)
    fb_connection = FaceBook::FacebookConnection.new
    fb_connection.post(text,options)
  end

  def share_on_linkedin(text,options)
    linkedin_conn = Linkdin::LinkedinConnection.new
    linkedin_conn.post(text,options)
  end

end
