module ApplicationHelper

	include SessionsHelper
	
	def full_title(page_title = '')  #　修改title
		base_title = '书简'
		if page_title.empty?
			base_title
		else
			base_title + " | " + page_title
		end
	end
end
