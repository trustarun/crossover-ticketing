class StatusesController < ApplicationController
	# return json to populate xedtable
	def index
		@statuses = Status.all
	end
end
