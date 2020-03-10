class PasswordController < ApplicationController

  def new
    render_bs_modal("reset_pwd","reset_password")
  end

  def create
    response = rest_call("post","api/v1/users/reset_password", { "user": { "email": params[:email]}}.merge(client_config))
      
    if response
      flash[:notice] = response["message"]
      redirect_to root_path
    end
  end
end
