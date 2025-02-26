Rails.application.routes.draw do
  root "home#index"

  get "join", to: "join#index"
  get "auth/:provider/callback", to: "auth#provider_callback"

  post "email_sign_in", to: "auth#email_sign_in"
  post "email_sign_up", to: "auth#email_sign_up"
  post "auth/google_oauth2", as: :google_oauth2_sign_in
  post "auth/facebook", as: :facebook_sign_in
  post "auth/linkedin", as: :linkedin_sign_in
  post "auth/reddit", as: :reddit_sign_in

  delete "logout", to: "auth#logout"
end
