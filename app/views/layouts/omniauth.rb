OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "499533736734875", "e866f99a81710e82f5ff921be366508f",
           :scope => "first_name, last_name, email, user_birthday",
           :image_size => "square", :display => "popup"
end