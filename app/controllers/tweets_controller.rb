class TweetsController < ApplicationController
  before_action :get_access_token

  def index
    content = @token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=monicasiraa")
    @parsed = JSON.parse(content.body)
    #@parsed = JSON.parse(content.body)
  end

  private

  def get_access_token
    @token = prepare_access_token(ENV["TOKEN"],ENV["TOKEN_SECRET"])
  end

  def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], { :site => "https://api.twitter.com", :scheme => :header })
    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

    return access_token
  end
end
