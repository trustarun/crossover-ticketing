class CategoriesController < ApplicationController
	# return category options to populate xeditable select
	def index
		@Categories = Category.all
	end
end
