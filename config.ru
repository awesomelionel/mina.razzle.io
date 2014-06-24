require "rubygems"
require "bundler"
Bundler.require

require 'rack-livereload'
if ENV['RACK_ENV'] == 'development'
  use Rack::LiveReload
end
use Rack::MethodOverride #for _method, PUT and DELET method overrides
#use Rack::Session::Cookie, :secret => 'somethinglongandsecret!@#$%'

require './app'
run App
