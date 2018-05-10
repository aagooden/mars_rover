require "sinatra"
require_relative "methods.rb"
enable :sessions


get "/" do
	erb :welcome
end


post "/page" do
	erb :first_page
end
