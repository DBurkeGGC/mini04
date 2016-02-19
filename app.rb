require 'sinatra'
require 'json'
require './lib/excel.rb'

enable :sessions

get '/' do
  if session['login']
    erb :excel
  else
    erb :login
  end
end

post '/logout' do 
  session['login'] = false
  erb :login
end

post '/login' do
  session['login'] = true
  erb :excel
end

post '/excel' do
  if session['login']
    myHash = { params['number'].to_i => Excel.new.to_excel(params['number']) }
    return JSON.generate(myHash)
  else
    erb :login
  end
end

get '/excel' do
  if session['login']
    myHash = { params['number'].to_i => Excel.new.to_excel(params['number']) }
    return JSON.generate(myHash)
  else
    erb :login
  end
end