Magento REST API - Ruby Client
================================


This library provides a wrapper around the Magento REST API for use within
Ruby apps.

### OAuth
The easiest way to obtain credentials is to use one of the Omniauth Ruby gems: 
* [gem1](https://github.com/Contiamo/omniauth-magento) 
* [gem2](https://github.com/Zookal/omniauth-magento). 

### Configuring Magento
@michaelimstepf has included some [detailed instructions](https://github.com/Zookal/omniauth-magento) with his gem.


### Usage
```
#initialize
config = {
  consumer_key:       'YOUR_CONSUMER_KEY',
  consumer_secret:    'YOUR_CONSUMER_SECRET',
  site:               'HTTP://WWW.YOURSITE.COM', #omit the trailing slash
  oauth_token:        'YOUR_OAUTH_TOKEN',
  oauth_token_secret: 'YOUR_TOKEN_SECRET',
}

api = Magento::Api.new(config)

#resource collection
products = api.products.all({page: 2})

#single resource
product = products(4).load

#update
api.products(4).update({description:"even cooler than before"})

#delete
api.products(4).delete

#child resource collection
api.products(4).images.all

#update child resource
api.products(4).images(2).update({...})

#custom call
products = api.connection.get('/api/rest/products/7/images')
```
