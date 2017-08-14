require 'bundler'
Bundler.require

require File.join(File.dirname(__FILE__),'lib', 'rack_test')
require File.join(File.dirname(__FILE__),'lib', 'request_handler')

RackTestApplication = RackTest.new

# Load the routes
require File.join(File.dirname(__FILE__),'config', 'routes')

run RequestHandler.new
