module Tweeter
  class TwitterConnection
    attr_accessor :consumer_key, :consumer_secret

    def initialize(options = {})
      consumer_key = options["consumer_key"]
      consumer_secret = options["consumer_secret"]
    end

    def post(text, options = {})
      user = get_twitter_client(options)
      user.update(text)
    end

    def get_twitter_timeline(options = {})
      user = get_twitter_client(options)
      Twitter.home_timeline
    end

    def get_twitter_followers(options = {})
      user = get_twitter_client(options)
      Twitter.followers
    end  


    def fetch_tweet_by_id(tweet_id, options = {})
      user = get_twitter_client(options)
      Twitter.status(tweet_id)
    end

    def fetch_twitter_friends(options = {})
      user = get_twitter_client(options)
      if options["name"]
        Twitter.friends(options["name"])
      elsif options["id"]
        Twitter.friends(options["id"])
      else  
        Twitter.friends
      end
    end

    protected
      def get_twitter_client(options = {})
        Twitter::Client.new(:consumer_key => self.consumer_key,
                                 :consumer_secret => self.consumer_secret,
                                 :oauth_token => options[:token],
                                 :oauth_token_secret => options[:secret]
                                ) 
      end

  end
end