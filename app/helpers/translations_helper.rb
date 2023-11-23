module TranslationsHelper
    def translate_to_japanese(query)
      api_key = ENV['DEEPL_KEY']
      uri = "https://api-free.deepl.com/v2/translate"
      client = HTTPClient.new
      client.ssl_config.clear_cert_store
      client.ssl_config.set_trust_ca("/etc/ssl/certs")
      params = {
        auth_key: api_key,
        text: query,
        target_lang: "JA"
      }
  
      response = client.get(uri, query: params)
      parsed_response = JSON.parse(response.body)
  
      translation_japanese = parsed_response["translations"][0]["text"]
      translation_japanese
    end
  end