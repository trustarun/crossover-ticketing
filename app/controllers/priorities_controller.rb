class PrioritiesController < ApplicationController
	# return priority options to populate xeditable select
	def index
		@priorities = Priority.all
	end
end
