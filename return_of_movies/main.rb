require "sinatra"
require "sinatra/reloader"
require "httparty"
require "Json"
require 'sqlite3'
require 'active_record'
require 'pry'


ActiveRecord::Base.logger = Logger.new(STDERR) #Show SQL in the terminal

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'movies.db'
)

require_relative 'movie'


after do
  ActiveRecord::Base.connection.close
end

get '/pry' do
  binding.pry
end

get '/' do
  erb :forms
end

get '/result/:name' do
  @movie = Movie.find_by :title => params[:name]
  unless @movie == nil
    @poster = @movie.poster
  else
    url = "http://www.omdbapi.com/?t=#{params[:name]}"
    raw_date = HTTParty.get(url)
    movie_date=JSON.parse raw_date
    @poster = movie_date['Poster']
    movie = Movie.new
    movie.title = params[:name]
    movie.poster = @poster
    movie.save
  end
  erb :result
end

get '/lists' do
  @title = params[:title]
  url = "http://www.omdbapi.com/?s=#{@title}"
  raw_date = HTTParty.get(url)
  movie_date=JSON.parse raw_date
  @array = movie_date['Search']
  if movie_date['Response'] == 'False'
    erb :error
  elsif @array.count == 1
    redirect to("/result/#{@array[0]['Title'].gsub(' ', '+')}")
  else
    erb :lists
  end
end
