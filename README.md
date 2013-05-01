# Socialshare

Ruby interface to update status on social networking sites.

## Installation

Add this line to your application's Gemfile:

    gem 'socialshare'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install socialshare

## Usage

1) for twitter

    s = Socialshare.share("TWITTER",:consumer_key => TWITTER_CONSUMER_KEY, 
                                    :consumer_secret => TWITTER_CONSUMER_SECRET,
                                    :user_token => twitter_user_token, 
                                    :user_secret => twitter_user_secret)

    s.post(text)                              #to tweet on twitter

    s.get_twitter_profile                     #to get your twitter timeline

    s.get_twitter_followers                   #to get your twitter followers

    s.fetch_tweet_by_id(tweet_id)             #fetch any tweet using tweet id

    s.fetch_twitter_friends(:name => "abc")   #fetch twitter friend by name

    s.fetch_twitter_friends(:id => "abc")     #fetch twitter friend by id

    s.fetch_twitter_friends                   # get all friends

2) for facebook

    s = Socialshare.share("FACEBOOK", :fb_token => facebook_user_token)

    s.post(text)                              #to post on facebook

    s.get_facebook_profile                    #to get your facebook profile  

    s.get_facebook_connections                #to get your facebook connections

3) for Linkedin

    s = Socialshare.share("LINKEDIN", :api_key => LINKEDIN_API_KEY, :secret_key => LINKEDIN_SECRET_KEY)

    s.post(text)                              #to post on linkedin

    s.get_linkedin_profile                    #to get your linkedin profile  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
