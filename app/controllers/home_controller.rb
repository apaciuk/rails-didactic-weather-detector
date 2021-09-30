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
    if @final_output == "Error"
      @api_color = "grey"
    elsif @final_output <= 50
      @api_color = "green"
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
    end



  end


  def terms
  end

  def privacy
  end
end
