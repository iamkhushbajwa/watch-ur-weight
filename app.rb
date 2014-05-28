require "sinatra"
require_relative "lib/report"

enable :sessions
set :session_secret, 'sharethatwork'

get '/' do
  erb :index
end