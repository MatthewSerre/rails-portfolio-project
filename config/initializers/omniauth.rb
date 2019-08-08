Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
end

# short term - .env file in root, add it to gitignore, use env variables for secret ids and keys
# long term - native rails credential encryption