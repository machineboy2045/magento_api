module Magento
  class Resource

    def initialize resource_name, connection
      @connection = connection
      @url = "/api/rest/#{resource_name}"
    end

    def all(params = {})
      response_handler do
        @connection.get(@url, params)
      end
    end

    def update(hash)
      response_handler do
        id = hash['id'] || hash[:id]
        @connection.put("#{@url}/#{id}", hash.to_json, { 'Content-Type' => 'application/json' })
      end
    end

    def create(hash)
      response_handler do
        @connection.post(@url, hash.to_json, { 'Content-Type' => 'application/json' })
      end

      #not sure why the server returns 404
      #after a succesful create
      rescue Net::HTTPServerException => e

    end

    def find(id)
      response_handler do
        @connection.get("#{@url}/#{id}")
      end
    end

    def delete(id)
      response_handler do
        @connection.delete("#{@url}/#{id}")
      end
    end

    def response_handler
      response     = yield
      code         = response.code
      code_type    = response.code_type
      body         = response.body
      content_type = response.content_type

      response.error! unless response.kind_of? Net::HTTPSuccess

      if content_type == 'application/json'
        JSON.parse(body)
      elsif body.respond_to?(:to_hash)
        body.to_hash
      else
        body
      end
    end

  end
end
