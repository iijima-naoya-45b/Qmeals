CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }
  config.fog_directory = ENV['AWS_BUCKET_NAME']
  config.asset_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['AWS_BUCKET_NAME']}"
end