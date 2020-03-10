module RestConcern
  extend ActiveSupport::Concern

  API_URLS = {
    authorization: {
      create: "oauth/token",
      revoke: "oauth/revoke"
    },
    user: {
      create: "api/v1/users"
    },
    widgets: {
      users: {
        widget: "api/v1/users/me/widgets"
      },
      visible: "api/v1/widgets/visible",
      create: "api/v1/widgets"
    }
  }

  def rest_call(method_name,relative_url,params={},headers={})
  	begin
  		response = RestClient::Request.execute(method: method_name.to_sym, url: "#{Rails.configuration.API_URL}/#{relative_url}",payload: params,headers: headers)
  		if response.code == 200  		
  			response = JSON.parse(response.body)
  		else
  			flash[:alert] = "Something went wrong."  			
  		end
  	rescue Exception => e      
  		flash[:alert] = e.message
  		if request.xhr?
  			render 'shared/bootstrap/render_flash.js'
  		else
  			redirect_to root_path
  		end
  		response = nil
  	end
  end

  def client_config    
    {
      "client_id" => Rails.configuration.CLIENT_ID,
      "client_secret" => Rails.configuration.CLIENT_SECERET
    }
  end

  def token_header
  	{ "Authorization" => "Bearer #{$access_token}" }
  end
end