class ItemsController < ApplicationController
	before_action :authenticate_user!

	def index
		@items = Items.all
	end
	
end
