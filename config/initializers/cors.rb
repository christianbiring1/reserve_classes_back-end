Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # allow do
  #   origins "http://localhost:3000"
  #   resources "*", header: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
  #   credentials: true
  # end

  # allow do
  #   origins "https://reserve_classes_back-end.herokuapp.com"
  #   resources "*", header: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
  #   credentials: true
  # end
end