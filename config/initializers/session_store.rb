if Rails.env === "production"
  Rails.application.config.session_store :cookie_store, key: "_reserve_classes_back-end", domain: "reserve_classes_back-end.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_reserve_classes_back-end"
end
