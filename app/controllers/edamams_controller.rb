class EdamamsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  require 'httpclient'
  require 'cgi'

  def index
    query = params[:search].blank? ? 'nodata' : CGI.escape(params[:search])
    client = HTTPClient.new
    res = client.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{query}&app_id=#{ENV.fetch('application_id',
                                                                                                      nil)}&app_key=#{ENV.fetch(
                                                                                                        'application_keys', nil
                                                                                                      )}")
    @foods = JSON.parse(res.body)
  end
end
