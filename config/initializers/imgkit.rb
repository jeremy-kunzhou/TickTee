# config/initializers/imgkit.rb
IMGKit.configure do |config|
	config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage_amd64').to_s if ENV['RACK_ENV'] == 'production'
end