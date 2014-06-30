shared_context "mock api" do
  let :api do
    connection = double(RestClient::Resource)
    api = Magento::Api.new
    api.instance_eval do
      @connection = connection
    end
    api
  end
end
