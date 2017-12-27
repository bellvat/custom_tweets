require 'oauth'

class OAuth
  attr_reader :access_token

  def initialize(oauth)
    @oauth = oauth
    @access_token = access_token
  end


  def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new("l6zTzkaN3jUOzFH7uJIbuRxJd", "BBOEdJK82RKMbuZXv5JlIvvRgcrXjxififPA6Ubme57IJN3PZq", { :site => "https://api.twitter.com", :scheme => :header })

    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

    return access_token
  end

end

@access_token = prepare_access_token("284534720-GIoVn8zLLuPRl6QfsGD3wSsEwoqLBwJ56CDTcg15", "OBhv2KGo5xSKNAExQTXaECGN1gw7tG1RLzYuD3n9d2h34")
