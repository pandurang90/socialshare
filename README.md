# Socialshare

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'socialshare'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install socialshare

## Usage

1) for twitter

    s = Socialshare.share("TWITTER", options)

    s.post(text)                              #to tweet on twitter

    s.get_twitter_profile                     #to get your twitter timeline

    s.get_twitter_followers                   #to get your twitter followers

    s.fetch_tweet_by_id(tweet_id)             #fetch any tweet using tweet id

    s.fetch_twitter_friends(:name => "abc")   #fetch twitter friend by name

    s.fetch_twitter_friends(:id => "abc")     #fetch twitter friend by id

    s.fetch_twitter_friends                   # get all friends

2) for facebook

    s = Socialshare.share("FACEBOOK", options)

    s.post(text)                              #to post on facebook

    s.get_facebook_profile                    #to get your facebook profile  

    s.get_facebook_connections                #to get your facebook connections

3) for Linkedin

    s = Socialshare.share("LINKEDIN", options)

    s.post(text)                              #to post on linkedin

    s.get_linkedin_profile                    #to get your linkedin profile  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
