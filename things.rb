require 'sinatra'
require 'json'

enable :sessions

get '/' do
  if session['login']
    song = { 'rick' => 'never gonna give you up' }
    return JSON.generate(song)
  else
    return "You are not logged in!"
  end
end

get '/names' do
  return JSON.generate(["Larry","Moe","Curly"])
end

post '/login' do
  session['login'] = true
  return "You are logged in!"
end

post '/msg' do
  return params['song'] + ": " + params['msg']
end

get '/secret' do
  if session['login']
    return "The secret is 42."
  else
    return "Go away! You are not logged in."
  end
end

#get excel path params
#params['number']
#take in number /excel?number=1
#response
#[1,"A"]