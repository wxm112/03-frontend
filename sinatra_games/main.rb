require 'sinatra'
require 'sinatra/reloader'


get '/' do 
    erb :home
end


get '/8_ball' do 
    erb :ball
end

get '/secret_number' do 
    erb :secret_number
end

get '/result' do
    @guess_number = params[:guess_number].to_i
    @secret_number = Random.rand(1..10)
    erb :result
end

get '/answer' do
    list = ["It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes definitely",
    "You may rely on it",
    "As I see it, yes",
    "Most likely",
    "Outlook good",
    "Yes",
    "Signs point to yes",
    "Reply hazy try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"]
    @question = params[:question]
    @answer = list[Random.rand(1..list.length)-1]
    erb :answer
end

get '/games/rock_paper_scissors/:throw' do 
    erb :rps
end

get '/result_rps' do
    list = ["rock","paper",'scissors']
     @choice = params[:throw]
     @computer = list[Random.rand(1..list.length)-1]
     if @choice == @computer
        erb :same_rps
    else
        erb :result_rps
    end
end
