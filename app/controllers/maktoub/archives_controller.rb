module Maktoub
  class ArchivesController < ApplicationController
    layout 'maktoub/newsletter_mailer'

    def show

      @archive = true
      template = params[:newsletter] || 'readme'
      template_data = Maktoub.template_data[template.to_sym] || {}

      @subject = template_data[:subject] || template.titleize
      @subcaption = template_data[:subcaption]

      render "maktoub/newsletters/#{template}"
    end
  end
end
