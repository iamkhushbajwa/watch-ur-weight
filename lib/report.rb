require 'json'
require 'rest_client'

class Report
  def json(response)
    JSON.parse(response)
  end

  def list_files(username, password, apikey)
    response =  RestClient.post 'https://my.workshare.com/api/open-v1.0/user_sessions.json', "user_session[email]" => username, "user_session[password]" => password, "device[app_uid]" => apikey
    resource = RestClient::Resource.new("https://my.workshare.com/api/open-v1.0/files.json", :cookies => response.cookies)
    resource.get(:accept => 'application/json')
  end

  def categories
    {
      videos: ["avi"],
      songs: ["mp3"],
      documents: ["odt", "docx"],
      binaries: ["bin"],
      text: ["txt"]
    }
  end

  def category?(extension)
    categories.each{|key, value|
      return key.to_s.capitalize if value.include?(extension)
    }
    return "Others"
  end
end