module Tweeter
  class TwitterConnection
    def post(text, options)
      user = get_twitter_client(options)
      user.update(text) if user.present?
    end

    def get_twitter_timeline(options)
      user = get_twitter_client(options)
      Twitter.home_timeline if user.present?
    end

    def get_twitter_followers(options)
      user = get_twitter_client(options)
      Twitter.followers if user.present?
    end  


    def fetch_tweet_by_id(tweet_id, options)
      user = get_twitter_client(options)
      Twitter.status(tweet_id) if user.present?
    end

    def fetch_twitter_friends(options)
      user = get_twitter_client(options)
      if user.present?
        if options["name"]
          Twitter.friends(options["name"])
        elsif options["id"]
          Twitter.friends(options["id"])
        else  
          Twitter.friends
        end
      end
    end

    protected
      def get_twitter_client(options)
        Twitter::Client.new(:consumer_key => TWITTER_CONSUMER_KEY,
                                 :consumer_secret => TWITTER_CONSUMER_SECRET,
                                 :oauth_token => options[:token],
                                 :oauth_token_secret => options[:secret]
                                ) 
      end

  end
end