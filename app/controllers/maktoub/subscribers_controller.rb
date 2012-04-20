module Maktoub
	class SubscribersController < ApplicationController

		def edit
		
		end
		
		def update
			Maktoub.unsubscribe params[:email]
		end

	end
end

