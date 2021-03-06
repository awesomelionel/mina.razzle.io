require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/assetpack'

class App < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::AssetPack

  configure :production do
    p "I'm in production"
  end

  configure :development do
    p "I'm in development"
    register Sinatra::Reloader
  end

  #assets do
    #serve '/js', from: 'js'
    #serve '/bower_components', from: 'bower_components'

    #js :modernizr, [
      #'/bower_components/modernizr/modernizr.js',
    #]

    #js :libs, [
      #'/bower_components/jquery/dist/jquery.js'
    #]

    #js :application, [
      #'/js/app.js'
    #]

    #js_compression :jsmin
  #end

  get '/' do
    haml :index
  end

  get '/hello' do
    "hello world!"
  end

  get '/hello/:name' do
    "hello, #{params[:name]}"
  end

  get '/date' do
    now = Time.now
    now_str = now.strftime("%Y-%m-%d")
    "The time now is #{now_str}"
  end

end

#if __FILE__ == $0
#  App.run! :port => 9292
#
