module Magento
  class Api

    attr_reader :connection

    def initialize(config = {})
      @config = config
      @base_url = '/api/rest/'

      #generate oauth v1 access token from config
      access_token = prepare_access_token()

      @connection = access_token
    end


    def get(resource_url, params = {}, options = {})
      url = @base_url + resource_url
      url += '?' + params.to_param if params.any?

      response_handler { @connection.get(url, options) }
    end



    def post(resource_url, params = {}, options = {})
      url     = @base_url + resource_url
      options = options.merge!({ 'Content-Type' => 'application/json' })
      params  = params.to_json

      response_handler { @connection.post(url, params, options) }
    end



    def put(resource_url, params = {}, options = {})
      url     = @base_url + resource_url
      params  = params.to_json
      options = options.merge({ 'Content-Type' => 'application/json' })

      response_handler { @connection.put(url, params, options) }
    end



    def delete(resource_url, options = {})
      url = @base_url + resource_url

      response_handler { @connection.delete(url, options) }
    end



    def response_handler
      response = yield
      body     = response.body

      #throw error if not success
      response.error! unless response.kind_of? Net::HTTPSuccess

      if response.content_type == 'application/json'
        JSON.parse(body)
      elsif body.respond_to?(:to_hash)
        body.to_hash
      else
        body
      end
    end



    private

    def prepare_access_token()
      consumer = OAuth::Consumer.new(@config[:consumer_key], @config[:consumer_secret], {:site => @config[:site]})
      token_hash = {:oauth_token => @config[:oauth_token], :oauth_token_secret => @config[:oauth_token_secret]}
      access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
    end

  end
end
