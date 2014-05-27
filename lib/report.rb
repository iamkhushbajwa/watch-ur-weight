require 'json'

class Report
  def json(response)
    JSON.parse(response)
  end
end