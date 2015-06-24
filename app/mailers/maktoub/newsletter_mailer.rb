require 'premailer'

module Maktoub
  class NewsletterMailer < ActionMailer::Base
    default from: Maktoub.from,
          parts_order: [ "text/html", "text/plain" ]

    default_url_options[:host] = Maktoub.home_domain

    def publish(newsletter_name, params)
      @name = params[:name]
      @subject = newsletter_name.humanize.titleize
      @email = params[:email]
      @newsletter_name = newsletter_name
      mail_fields = {
        
      }

      premailer = Premailer.new(render("maktoub/newsletters/#{newsletter_name}").to_s,
                        with_html_string: true,
                        link_query_string: "utm_source=newsletter&utm_medium=email&utm_campaign=#{CGI::escape(@subject)}"
                      )

      mail(
        subject: @subject,
        to: params[:email],
        body: premailer.to_inline_css, 
        content_type: "text/html"
      )
    end
  end
end

