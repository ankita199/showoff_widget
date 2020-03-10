class WidgetsController < ApplicationController
  def index
    if params[:own]
      response = rest_call("get",API_URLS[:widgets][:users][:widget], {"term" => params[:search]}.merge(client_config),token_header)
    else
      response = rest_call("get",API_URLS[:widgets][:visible], {"term" => params[:search]}.merge(client_config))
    end
    if response
      @widgets = response["data"]["widgets"]
    end
  end

  def new
    render_bs_modal("new_widget","form")
  end

  def create
    response = rest_call("post",API_URLS[:widgets][:create], { "widget" => widget_params.to_h } ,token_header )
    if response
      flash[:notice] = "Widget Created Successfully."
      close_bs_modal("new_widget",true)
    end
  end

  private

  def widget_params
    params.require(:widget).permit(:name,:description,:kind)
  end
end
