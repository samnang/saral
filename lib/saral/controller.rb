module Saral
  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def request
      @request ||= Rack::Request.new(env)
    end

    def render(view_name, locals = {})
      filename = File.join "app", "views", controller_view_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env)
    end

    def controller_name
      klass = self.class.name.gsub /Controller$/, ""
      Saral.to_underscore klass
    end
  end
end
