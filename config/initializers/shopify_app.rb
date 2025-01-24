ShopifyApp.configure do |config|
  config.application_name = "Ranter traker"
  config.api_key = "bfb97c06efd23ddeed42a1c277126d4c"
  config.secret = "6683c3b241b05d5f473c0990e8c108fd"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
