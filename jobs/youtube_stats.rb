# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
#!/usr/bin/env ruby
require 'net/https'
require 'uri'




SCHEDULER.every '360m', :first_in => 0 do |job|

  API_KEY = ENV["YOUTUBE_API"]
  
  #SEE HERE FOR API: http://www.jarloo.com/yahoo_finance/
  http = Net::HTTP.new("www.googleapis.com", 443)
  http.use_ssl = true
  response = http.request(Net::HTTP::Get.new("/youtube/v3/channels?part=statistics&id=UCTtZPn_bD6ekitgbfakcsgg&key=#{API_KEY}"))

  if response.code != "200"
    puts "Youtube stock quote communication error (status-code: #{response.code})\n#{response.body.to_s}"
  else

    json = JSON.parse(response.body)
   
 #   puts response[:items].to_s
    # send single value and change to dashboard
    widgetVarname = "youtube_subscribers"
    stats = json["items"][0]["statistics"]
    
    subscriber_count = stats["subscriberCount"]

    view_count = stats["viewCount"]
    widgetData = { current: subscriber_count }
    if defined?(send_event)
      send_event(widgetVarname, widgetData)
      send_event("youtube_views", {current: view_count})
    end 
  end
end


