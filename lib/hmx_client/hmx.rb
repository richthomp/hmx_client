require 'rubygems'
require 'rest_client'
require 'json'

class Hmx
  def initialize(url, urlapi)
    @urlapi = urlapi
    response = RestClient.get url
    @context = JSON.parse(response.to_str)    
  end
  def performRequest(prefix, function, command)
    response = RestClient.post @urlapi+'/'+prefix, :function=>function, :params=>JSON.generate(command), :multipart=>true
    puts "Raw response is " + response.to_str
    return JSON.parse(response.to_str)
  end
  def getSenderHash()
    hash = Hash.new
    hash['context'] = @context
    return hash
  end
  def getData(displayName)
    hash = getSenderHash()
    hash['displayName'] = displayName
    response = performRequest('user', 'GETDATA', hash)
    return response['data']
  end
  def getContent(displayName)
    hash = getSenderHash()
    hash['displayName'] = displayName
    response = performRequest('user', 'GETCONTENT', hash)
    return response['content']
  end
  def putData(data)
    hash = getSenderHash()
    hash['data'] = data
    response = performRequest('user', 'PUTDATA', hash)
    return response['content']
  end
  def putSimpleData(displayName, content)
    hash = getSenderHash()
    hash['displayName'] = displayName
    hash['content'] = content
    response = performRequest('user', 'PUTSIMPLEDATA', hash)
    return response['data']
  end
end
