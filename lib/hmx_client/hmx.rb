require 'rubygems'
require 'rest_client'
require 'json'

class Hmx
  def initialize(url, urlapi)
    @urlapi = urlapi
    response = RestClient.get url
    @context = JSON.parse(response.to_str)    
  end
  def get(displayName)
    hash = Hash.new
    hash['context'] = @context
    hash['displayName'] = displayName
    response = performRequest('user', 'GETDATA', hash)
    return response.to_str
  end
  def put(displayName, content)
    hash = Hash.new
    hash['context'] = @context
    hash['displayName'] = displayName
    hash['content'] = content
    response = performRequest('user', 'PUTSIMPLEDATA', hash)
    return response.to_str
  end
  def performRequest(prefix, function, command)
    response = RestClient.post @urlapi+'/'+prefix, :function=>function, :params=>JSON.generate(command), :multipart=>true
    return response
  end
 end
