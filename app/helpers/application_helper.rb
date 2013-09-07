module ApplicationHelper
	def display_base_errors resource
		return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
		messages=resource.errors[:base].map{|msg| content_tag(:p,msg)}.join
		html = <<-HTML
			<div class="alert alert-error alert-block">
				<buuton type="button" class="close" data-dismiss="alert">&#215;</buuton>
				#{messages}
			</div>
		HTML

		html.html_safe
	end
end
