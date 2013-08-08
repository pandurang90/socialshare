require 'twitter'

module Socialshare
  class Tweeter
    attr_accessor :consumer_key, :consumer_secret, :user_token, :user_secret, :twitter_user

    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @user_token = options[:token]
      @user_secret = options[:secret]
      @twitter_user = get_twitter_client(options)
    end

    def post(text,options = {})
      begin
        if options.present?
          self.twitter_user.update_with_media(text,File.open(options[:file])) 
        else
          self.twitter_user.update(text)
        end
      rescue Exception => e
        return e
      end
    end

    def get_twitter_profile
      begin
        self.twitter_user.user
      rescue Exception => e
        return e
      end
    end

    def update_profile_photo(file_path)
      begin
        self.twitter_user.update_profile_image(File.open(file_path))
      rescue Exception => e
        return e
      end
    end

    def update_profile_background_photo(file_path)
      begin
        self.twitter_user.update_profile_background_image(File.open(file_path))
      rescue Exception => e
        return e
      end
    end

    def user_timeline
      begin
        self.twitter_user.user_timeline
      rescue Exception => e
        return e
      end
    end
  
    def get_twitter_home_timeline
      begin
        self.twitter_user.home_timeline
      rescue Exception => e
        return e
      end
    end

    def get_twitter_followers
      begin
        self.twitter_user.followers
      rescue Exception => e
        return e
      end
    end  

    def fetch_tweet_by_id(tweet_id)
      begin
        self.twitter_user.status(tweet_id)
      rescue Exception => e
        return e
      end
    end

    def fetch_twitter_friends(options = {})
      begin
        if options[:name]
          self.twitter_user.friends(options[:name])
        elsif options[:id]
          self.twitter_user.friends(options[:id])
        else  
          self.twitter_user.friends
        end
      rescue Exception => e
        return e
      end     
    end

    protected
      def get_twitter_client(options = {})
        Twitter::Client.new(:consumer_key => options[:consumer_key],
                            :consumer_secret => options[:consumer_secret],
                            :oauth_token => options[:token],
                            :oauth_token_secret => options[:secret]
                            ) 
      end

  end
end