require "sinatra"
require_relative "lib/report"
require 'dotenv'
Dotenv.load

enable :sessions
set :session_secret, 'sharethatwork'

get '/' do
  erb :index
end

post '/' do
  report = Report.new
  response = report.list_files(params[:username], params[:password], ENV['WORKSHARE_API_KEY'])
  parsed = report.json(response)
  files = report.extract_files(parsed)
  categories = report.extract_categories(files)
  displacement = report.displacement(categories, files)
  total_weight = report.total_weight(categories)
  session[:report] = report.result(categories, displacement, total_weight)
  redirect '/'
end