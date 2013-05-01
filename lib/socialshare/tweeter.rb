module Socialshare
  class Tweetter
    attr_accessor :consumer_key, :consumer_secret, :user_token, :user_secret, :twitter_user

    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @user_token = options[:token]
      @user_secret = options[:secret]
      @twitter_user = get_twitter_client(options)
    end

    def post(text)
      self.twitter_user.update(text)
    end

    def get_twitter_profile
      self.twitter_user.home_timeline
    end

    def get_twitter_followers
      self.twitter_user.followers
    end  


    def fetch_tweet_by_id(tweet_id)
      self.twitter_user.status(tweet_id)
    end

    def fetch_twitter_friends(options = {})
      if options[:name]
        self.twitter_user.friends(options[:name])
      elsif options[:id]
        self.twitter_user.friends(options[:id])
      else  
        self.twitter_user.friends
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