module Maktoub
  class ArchivesController < ApplicationController
    layout 'maktoub/newsletter_mailer'
    def show
      @archive = true
      @subject = params[:newsletter] || 'readme'

      render "maktoub/newsletters/#{@subject}"
    end

  end
end

