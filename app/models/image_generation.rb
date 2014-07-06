#!/usr/bin/ruby
#require 'imgkit'
#require 'rest_client'
#require 'stringio'

module ImageGeneration
  def self.generateImage(project_name, day_left, color, current_pct, diff_pct, path)
    color_text = color
    current_percentage = "#{current_pct}%";
    diff_percentage = "#{diff_pct}%";
    html = <<-here
    <!DOCTYPE HTML>
    <html lang="en">
    <head>
    	<meta charset="UTF-8">
    </head>
    <body style="margin: 1 1 0 1; padding: 0; font-size: 12px;">
    dsf
    </body>
    </html>
    here
    kit = IMGKit.new(html, width: 300, height: 50)
    kit.to_file(path)
    kit
  end
  
end
