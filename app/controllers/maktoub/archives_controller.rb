module Maktoub
  class ArchivesController < ApplicationController
    layout 'maktoub/newsletter_mailer'

    def show
      @archive = true
      template = params[:newsletter] || 'readme'
      @subject = template.titleize

      render "maktoub/newsletters/#{template}"
    end
  end
end
