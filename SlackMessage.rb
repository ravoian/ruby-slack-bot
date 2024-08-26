require 'net/http'
require 'json'

# Configure Slack data
uri = URI("https://slack.com/api/chat.postMessage")
channelId = "<your_channel_here>" 
message = "Test"
token = "<your_token_here>"

res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
  req = Net::HTTP::Post.new(uri)

  # Configure headers
  req['Content-Type'] = 'application/json'
  req['Authorization'] = 'Bearer ' + token

  # Set body data
  req.body = {channel: channelId, text: message}.to_json
  response = http.request(req)

  # Display results
  puts JSON.pretty_generate(JSON.parse(response.body))

end
