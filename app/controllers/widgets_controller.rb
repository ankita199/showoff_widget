class WidgetsController < ApplicationController
  def create
		begin
			response = RestClient.post("#{Rails.configuration.API_URL}/api/v1/widgets", { "widget" => widget_params.to_h, "Authorization" => "Bearer #{$access_token}" })
		rescue Exception => e
			binding.pry
		end
	end

	private

	def widget_params
		params.require(:widget).permit(:name,:description,:kind)
	end
end
