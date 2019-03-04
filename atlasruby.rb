require 'httparty'
require 'json'

class Atlas
    include HTTParty
    base_uri 'https://cloud.mongodb.com/api/atlas/v1.0/'

    def initialize(u,p)
        @auth= {:username=>u,:password=>p}
    end

    def get(uri)
        self.class.get(uri,{ :digest_auth => @auth })
    end
end

client=Atlas.new(ENV['ATLAS_USER'],ENV['ATLAS_USER_KEY'])

result=JSON.parse(client.get('').body())

pp result
