require "socialshare/version"

module Socialshare
  # Your code goes here...
  def self.post(text,social_site_name,options={})
    if social_site_name=="TWITTER"
      share_on_twitter(text,options)
    elsif social_site_name=="FACEBOOK"
      share_on_facebook(text,options)
    elsif social_site_name=="LINKEDIN"
      share_on_linkedin(text,options)
    end  
  end

  def share_on_twitter(text,options)
    user = Twitter::Client.new(:consumer_key => TWITTER_CONSUMER_KEY,
                               :consumer_secret => TWITTER_CONSUMER_SECRET,
                               :oauth_token => options[:token],
                               :oauth_token_secret => options[:secret]
                              ) 
    user.update(text)
  end

  def share_on_facebook(text,options)
    post = Koala::Facebook::API.new(options[:fb_token])
    post.put_wall_post(text)
  end

  def share_on_linkedin(text,options)
    user = LinkedIn::Client.new(LINKEDIN_API_KEY, LINKEDIN_SECRET_KEY)
    user.authorize_from_access(options[:token], options[:secret])    
    user.add_share(:comment => text)
  end

  def get_linkedin_profile(options)
    user = LinkedIn::Client.new(LINKEDIN_API_KEY, LINKEDIN_SECRET_KEY)
    user.authorize_from_access(options[:token], options[:secret])  
    user.profile
  end

  def get_twitter_timeline(options)
    user = Twitter::Client.new(:consumer_key => TWITTER_CONSUMER_KEY,
                               :consumer_secret => TWITTER_CONSUMER_SECRET,
                               :oauth_token => options[:token],
                               :oauth_token_secret => options[:secret]
                              ) 
    Twitter.home_timeline
  end

  def get_twitter_followers(options)
    user = Twitter::Client.new(:consumer_key => TWITTER_CONSUMER_KEY,
                               :consumer_secret => TWITTER_CONSUMER_SECRET,
                               :oauth_token => options[:token],
                               :oauth_token_secret => options[:secret]
                              ) 
    Twitter.followers
  end  

  def get_facebook_profile(options)
    post = Koala::Facebook::API.new(options[:fb_token])
    profile = post.get_object("me")
  end

  def get_facebook_connections(options)
    post = Koala::Facebook::API.new(options[:fb_token])
    post.get_connections("me", "friends")
  end

end
