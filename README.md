# Socialshare

Ruby interface to update status(text, image, video) on social networking sites(Facebook, Twitter, Linkedin).

## Installation

Add this line to your application's Gemfile:

    gem 'socialshare'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install socialshare

## Usage

1) for twitter

    s = Socialshare::Tweeter.new(:consumer_key => TWITTER_CONSUMER_KEY, 
                            :consumer_secret => TWITTER_CONSUMER_SECRET,
                            :token => twitter_user_token, 
                            :secret => twitter_user_secret)

    s.post(text)                              #to tweet on twitter

    s.get_twitter_profile                     #to get your twitter profile

    s.user_timeline                           #to get your twitter timeline

    s.twitter_user.update_with_media(text,YOUR_FILE_PATH)      #to tweet on twitter with image or video  

    s.get_twitter_home_timeline               #to get home twitter timeline  

    s.update_profile_photo(YOUR_IMAGE_PATH)   #update your twitter profile image      

    s.update_profile_background_photo(YOUR_IMAGE_PATH)         #update your twitter profile background image

    s.get_twitter_followers                   #to get your twitter followers

    s.fetch_tweet_by_id(tweet_id)             #fetch any tweet using tweet id

    s.fetch_twitter_friends(:name => "abc")   #fetch twitter friend by name

    s.fetch_twitter_friends(:id => "abc")     #fetch twitter friend by id

    s.fetch_twitter_friends                   # get all friends

2) for facebook

    s = Socialshare::Facebook.new(:fb_token => facebook_user_token)

    s.post(text)                              #to post on facebook

    s.get_facebook_profile                    #to get your facebook profile  

    s.get_facebook_connections                #to get your facebook connections

    s.share_picture(FILE_PATH)                #to share image on facebook  

    s.share_video(FILE_PATH)                  #to share video on facebook  

3) for Linkedin

    s = Socialshare::Linkdin.new(:api_key => LINKEDIN_API_KEY, 
                                 :secret_key => LINKEDIN_SECRET_KEY,
                                 :user_token => twitter_user_token, 
                                 :user_secret => twitter_user_secret)

    s.post(text)                              #to post on linkedin

    s.get_linkedin_profile                    #to get your linkedin profile  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
