shared_context "integration" do
  let :api do
    Magento::Api.new(config = {
      consumer_key:       '1c5669e2a3114edf8cc73573c3b71010',
      consumer_secret:    'ca20b4d25180c1c5630272dec979f094',
      site:               'http://www.jayzheng.com/sb_magento',
      oauth_token:        '881acaefa956bc82630c1d91b1e3a126',
      oauth_token_secret: '573615aa4a20e8c055edc7acc455281d',
    })
  end
end