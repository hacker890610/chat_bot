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

data = {
  "prompt" => "Donne moi une recette de ton choix",
  "max_tokens" => 100,
  "temperature" => 0.5
}

response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip



puts "voici une idee de recette :"
puts response_string