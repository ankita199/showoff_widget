class UserSessionsController < ApplicationController

  def new
    render_bs_modal("login","login")
  end

  def create    
    response = rest_call("post",API_URLS[:authorization][:create], { "grant_type": "password","username": params[:email],"password": params[:password] }.merge(client_config))    
    if response
      $access_token = response["data"]["token"]["access_token"]
      close_bs_modal("login",true)    
    end
  end

  def destroy
    response = rest_call("post",API_URLS[:authorization][:revoke], {"token": params[:id]}, token_header)
    if response
      flash[:notice] = "Signout Successfully."
      $access_token = nil
      redirect_to root_path
    end
  end
end
