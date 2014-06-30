module Magento
  class Api

    attr_reader :connection

    def initialize(config = {})
      @config = config

      #generate oauth v1 access token from config
      access_token = prepare_access_token()


      #use RestClient resource style
      @connection = access_token
    end

    def method_missing(meth, *args)
      Magento::Resource.new(meth, @connection)
    end

    private

    def prepare_access_token()
      consumer = OAuth::Consumer.new(@config[:consumer_key], @config[:consumer_secret], {:site => @config[:site]})
      token_hash = {:oauth_token => @config[:oauth_token], :oauth_token_secret => @config[:oauth_token_secret]}
      access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
    end

  end
end
