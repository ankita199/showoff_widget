module BootstrapConcern
  extend ActiveSupport::Concern  
  def render_bs_modal(modal_id, partial, modal_size = "", locals={})
    @modal_id = modal_id
    @partial = partial
    @locals = locals
    @modal_size =
    case modal_size
    when "small" then "modal-sm"
    when "large" then "modal-lg"
    else ""
      "modal-md"
    end
    @static = locals.fetch(:static, true)
    render 'shared/bootstrap/bs_modal.js'
  end

  def close_bs_modal(modal_id,page_reload = false)
    @modal_id = modal_id
    @page_reload = page_reload
    render 'shared/bootstrap/close_bs_modal.js'
  end
end