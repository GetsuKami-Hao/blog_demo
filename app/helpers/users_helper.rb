module UsersHelper
	#获取bootstrap所需要的class和placeholder。
	def get_form_hash(className,place) 
		{ class: "#{className}", placeholder: "#{place}" }
	end
end
