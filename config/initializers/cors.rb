Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://6348e50f95e5525da6d1c6e5--scintillating-liger-4d35b6.netlify.app/"

    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end