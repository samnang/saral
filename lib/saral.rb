require "saral/version"
require "saral/routing"
require "saral/controller"
require "saral/util"
require "saral/dependencies"

module Saral
  class Application
    def call(env)
      return [302, {'Location'=> '/courses/create' }, []] if env["PATH_INFO"] == '/'

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      if controller.respond_to?(act)
        text = controller.send(act)
        [200, {'Content-Type' => 'text/html'}, [text]]
      else
        [404, {'Content-Type' => 'text/html'}, ["Sorry! Page not found."]]
      end
    end
  end
end
