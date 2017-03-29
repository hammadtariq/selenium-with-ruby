require 'rest-client'
require 'jsonpath'
require 'json'

require_relative 'config.rb'

module SSIMATAAPI

  host = Config.settings['localhost']

  @cookies = {}
  @client = RestClient::Resource.new(host)

  def SSIMATAAPI.login(email, password)
    response = @client["account"].post({
        email: email,
        password: password
    })

    @cookies = response.cookies
    return response
  end

  def SSIMATAAPI.getProjects()
    return @client["media-projects"].get(:cookies => @cookies)
  end

end

# response = SSIMATAAPI.login("qa001@artstor.org", "artstor")
# # puts JSON.parse(response.body)['email']
# puts JsonPath.on(response.body, 'email')
# puts JsonPath.on(SSIMATAAPI.getProjects().body, 'items[0].name')
