class HomeController < ApplicationController
	def index
		begin
			response = RestClient.get("#{Rails.configuration.API_URL}/api/v1/widgets/visible", params: {"client_id" => Rails.configuration.CLIENT_ID,	"client_secret" => Rails.configuration.CLIENT_SECERET , "Authorization" => "Bearer #{$access_token}","term" => params[:search]})			
			if response.code == 200
				@widgets = JSON.parse(response.body)["data"]["widgets"]
				puts "=====#{@widgets.length}====="
			end
		rescue Exception => e

		end
	end
end
