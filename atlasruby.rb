require 'httparty'
require 'json'

class Atlas
    include HTTParty
    base_uri 'https://cloud.mongodb.com/api/atlas/v1.0/'

    def initialize(u,p)
        @auth= {:username=>u,:password=>p}
    end

    def getBase()
        options = { :digest_auth => @auth }
        self.class.get('',options)
    end
end


user = ENV['ATLAS_USER']
userkey = ENV['ATLAS_USER_KEY']

client=Atlas.new(user,userkey)

result=JSON.parse(client.getBase().body())

print JSON.pretty_generate(result)
