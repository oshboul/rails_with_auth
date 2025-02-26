Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:google_oauth2, ENV["google_oauth2_key"], ENV["google_oauth2_secret"], scope: "email,profile")
  provider(:facebook, ENV["facebook_key"], ENV["facebook_secret"], scope: "public_profile")
  provider(:linkedin, ENV["linkedin_key"], ENV["linkedin_secret"], scope: "openid,profile")
  provider(:reddit, ENV["reddit_key"], ENV["reddit_secret"], scope: "identity")
end
