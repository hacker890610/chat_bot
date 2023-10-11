require 'http'
require 'json'
require 'dotenv'

Dotenv.load('.env')

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/engines/text-babbage-001/completions"

headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

while true
    print "Vous : "
    user_input = gets.chomp 

    break if user_input.downcase == "exit"

    prompt = "User: #{user_input}nBot:"


    data = {
    "prompt" => prompt ,
    "max_tokens" => 100,
    "temperature" => 0.5
    }
    prompt = data["prompt"]

    response = HTTP.post(url, headers: headers, body: data.to_json)
    response_body = JSON.parse(response.body.to_s)
    bot_response = response_body['choices'][0]['text'].strip



    puts "Bot: #{bot_response}\n\n"
end

puts "Bye!"