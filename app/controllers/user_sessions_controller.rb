class UserSessionsController < ApplicationController

	def new
		helpers.render_bs_modal("login","user_sessions/login","large")
	end 

	def create
		begin
			response = RestClient.post("#{Rails.configuration.API_URL}/oauth/token", { "client_id" => Rails.configuration.CLIENT_ID,	"client_secret" => Rails.configuration.CLIENT_SECERET, "grant_type": "password","username": params[:email],"password": params[:password] })
			binding.pry
			if response.code == 200
				$access_token = JSON.parse(response.body)["data"]["token"]["access_token"]
			end			
		rescue Exception => e
			binding.pry
		end
	end
end
