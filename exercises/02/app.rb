class Application
  def call(env)
    content = env.map { |k, v| "<strong>#{k}</strong> => #{v}" }.join("<br/>")

    [200, {'Content-Type' => 'text/html'}, [content]]
  end
end
