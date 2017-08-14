RackTestApplication.router.config do
  get "/test", :to => "test#index"
  get /.*/, :to => "test#show"
end
