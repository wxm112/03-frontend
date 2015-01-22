require 'sinatra'
require 'sinatra/reloader'


get '/' do 
    erb :home
end


get '/8_ball' do 
    erb :ball
end

get '/rps' do 
    erb :rps
end

get '/secret_number' do 
    erb :secret_number
end