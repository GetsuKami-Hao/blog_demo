module UsersHelper
	def get_form_hash(className,place)
		{ class: "#{className}", placeholder: "#{place}" }
	end
end
