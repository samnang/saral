require 'bundler'
Bundler.require

$LOAD_PATH << File.join(__dir__, '..', 'app', 'controllers')
require 'courses_controller'

module SaralStreetView
  class Application < Saral::Application
  end
end
