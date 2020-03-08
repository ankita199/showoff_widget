class UsersController < ApplicationController
	def create
		begin
			response = RestClient.post("#{Rails.configuration.API_URL}/api/v1/users", { "client_id" => Rails.configuration.CLIENT_ID,	"client_secret" => Rails.configuration.CLIENT_SECERET,"user" => params.except("utf8","authenticity_token","controller","action","commit").permit!.to_h.merge("image_url": "https://static.thenounproject.com/png/961-200.png")}.to_json, {content_type: 'application/json', accept: :json}
		rescue Exception => e
		end
	end

	private

	def user_params
		params.require(:user).permit(:name,:description,:kind)
	end
end
