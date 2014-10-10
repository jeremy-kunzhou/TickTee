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
    <div style="float:left;">#{project_name}: </div> #{day_left == nil ? "":"<div style=\"float:right;\">#{day_left} days left. #{diff_percentage} behind schedule.</div>"}
    <div style="height:20px; margin_bottom;20px; overflow:hidden; background-color:#f5f5f5; border-radius:4px; box-shadow: inset 0 1px 2px rgba(0,0,0,.1); clear:both;">
      <div style="width: #{current_percentage};  color:#{current_percentage == 0? '#777':'#fff'}; background-color: #428bca; float: left; height: 100%; min-width:5%; font-size:12px; line-height:20px; text-align: center; ">#{current_percentage}</div>
      #{diff_pct == nil ? "": diff_pct > 0 ? "<div style=\"width: #{diff_percentage};  color:#{diff_percentage == 0? "#777":"#fff"}; background-color: #dc143c; float: left; height: 100%; min-width: 0%; font-size:12px; line-height:20px; text-align: center; \"></div>":""}
    </div>
    </body>
    </html>
    here
    kit = IMGKit.new(html, width: 300, height: 60)
    kit.to_file(path)
    kit
  end
  
end
