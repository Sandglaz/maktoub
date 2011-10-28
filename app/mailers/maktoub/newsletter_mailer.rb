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
        subject: @subject,
        to: params[:email]
      }

      premailer = Premailer.new(render("maktoub/newsletters/#{newsletter_name}").to_s,
                        with_html_string: true,
                        link_query_string: CGI::escape("utm_source=newsletter&utm_medium=email&utm_campaign=#{@subject}")
                      )

      mail(mail_fields) do |format|
        format.text { premailer.to_plain_text.html_safe }
        format.html { premailer.to_inline_css.html_safe }
      end
    end
  end
end

