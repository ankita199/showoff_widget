class UsersController < ApplicationController

	def new
		render_bs_modal("signup_user","signup")
	end

  def create    
    response = rest_call("post",API_URLS[:user][:create], { "user" => user_params.to_h }.merge(client_config))
    if response      
      close_bs_modal("signup_user",true)    
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password)
  end
end
