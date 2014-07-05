# config/initializers/imgkit.rb
IMGKit.configure do |config|
	config.wkthmltoimage = Rails.root.join('bin', 'wkhtmltoimage').to_s if ENV['RACK_ENV'] == 'production'
end