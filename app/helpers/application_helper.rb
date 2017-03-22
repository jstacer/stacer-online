module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title = '')
    	base_title = "Jud Stacer | Web Developer"
    	if page_title.empty?
      		base_title
    	else
      		page_title + " | " + "Jud Stacer"
    	end
  	end
end