class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = "https://www.airnowapi.org/aq/forecast/zipCode/?format=application/json&zipCode=20002&date=2021-09-29&distance=0&API_KEY=21D02493-2437-45C8-BE31-4F06673D95D7"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    # Check for empty term
    if @output.empty?
      @final_output = "Error"
    else
      @final_output = @output[0]['AQI']
    end



  end


  def terms
  end

  def privacy
  end
end
