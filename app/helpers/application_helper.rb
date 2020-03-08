module ApplicationHelper
	def render_bs_modal(modal_id, partial, modal_size="", locals={})
		@modal_id = modal_id
		@partial = partial
		@locals = locals
		@modal_size =
		case modal_size
		when "small" then "modal-sm"
		when "large" then "modal-lg"
		else ""
		end
		@static = locals.fetch(:static, true)
		render file: "shared/bs_modal"
	end
end
