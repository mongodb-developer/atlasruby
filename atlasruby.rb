require 'httparty'
require 'json'

auth={:username=>ENV['ATLAS_USER'],:password=>ENV['ATLAS_USER_KEY']}
baseurl='https://cloud.mongodb.com/api/atlas/v1.0/'

result=HTTParty.get(baseurl,  { :digest_auth => auth } )

pp JSON.parse(result.body())
