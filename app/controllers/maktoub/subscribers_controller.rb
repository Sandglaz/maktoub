module Maktoub
	class SubscribersController < ApplicationController
		layout 'maktoub/application'

		def edit
			@email = params[:email]
		end
		
		def update
			if params[:email].blank?
				@message = "email is required"
				render :edit, :status => 400
			else
				Maktoub.unsubscribe params[:email]
			end
		end

	end
end

