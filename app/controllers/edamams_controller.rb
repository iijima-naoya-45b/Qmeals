class EdamamsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  require 'httpclient'
  require 'cgi'
  def index
    query = params[:search].blank? ? 'nodata' : CGI.escape(params[:search])
    client = HTTPClient.new
    res = client.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{query}&app_id=#{ENV['application_id']}&app_key=#{ENV['application_keys']}")
    @foods = JSON.parse(res.body)
  end
end
