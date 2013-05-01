require "socialshare/version"
require "socialshare/tweeter"
require "socialshare/face_book"
require "socialshare/linkdin"

module Socialshare
  # Your code goes here...
  def self.twitter(options={})
    Tweeter::TwitterConnection.new(options)
  end

  def self.facebook(options={})
    FaceBook::FacebookConnection.new
  end

  def self.linkedin(options={})
    Linkdin::LinkedinConnection.new(options)
  end


end
