class EdamamsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  require 'httpclient'
  require 'cgi'
  require 'deepl'
  

  def index
    query = params[:search].blank? ? 'nodata' : params[:search]

    translated_query = translate_to_english(query)

    client = HTTPClient.new
    res = client.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{CGI.escape(translated_query)}&app_id=#{ENV.fetch('application_id', nil)}&app_key=#{ENV.fetch('application_keys', nil)}")
    @foods = JSON.parse(res.body)
    
  end

  private

  def translate_to_english(query)
    api_key = ENV['DEEPL_KEY']
    uri = ("https://api-free.deepl.com/v2/translate")
    client = HTTPClient.new
    client.ssl_config.clear_cert_store
    client.ssl_config.set_trust_ca("/etc/ssl/certs")
    params = {
      auth_key: api_key,
      text: query,
      target_lang: "EN"
    }
      
    
    response = client.get(uri, query: params)
    parsed_response = JSON.parse(response.body)

    translation_text = parsed_response["translations"][0]["text"]
    translation_text
  end
end
