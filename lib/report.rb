require 'json'
require 'rest_client'
require_relative "user_file"
require 'active_support/inflector'

class Report
  def json(response)
    JSON.parse(response)
  end

  def list_files(username, password)
    response =  RestClient.post 'https://my.workshare.com/api/open-v1.0/user_sessions.json', "user_session[email]" => username, "user_session[password]" => password, "device[app_uid]" => ENV['WORKSHARE_API_KEY']
    resource = RestClient::Resource.new("https://my.workshare.com/api/open-v1.0/files.json", :cookies => response.cookies)
    resource.get(:accept => 'application/json')
  end

  def extract_files(parsed)
    parsed["files"].map{|file| UserFile.new(file["extension"], file["size"])}
  end

  def extract_categories(files)
    categories = Hash.new
    files.each do |file|
      if categories[file.category]
        categories[file.category][:files_count] += 1
        categories[file.category][:total_weight] += file.weight
      else
        categories[file.category] = {files_count: 1, total_weight: file.weight}
      end
    end
    categories
  end

  def total_weight(categories)
    sum = 0
    categories.each{|key,value| sum += value[:total_weight]}
    sum
  end

  def total_ideal_weight(files)
    sum = 0
    files.each{ |file| sum += file.size }
    sum
  end

  def displacement(categories, files)
    (total_weight(categories) - total_ideal_weight(files)).round(2)
  end

  def result(categories, displacement, total_weight)
    result = "My Files (category / gravity)\n"
    categories.each{|key,value|
      category = value[:files_count] > 1 ? key.pluralize : key
      result << "#{value[:files_count]} #{category}    #{value[:total_weight].round(2)}\n"
    }
    result << "\nTotal:    #{total_weight}\nDisplacement:    #{displacement}"
  end
end