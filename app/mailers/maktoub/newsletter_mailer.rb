require 'premailer'

module Maktoub
  class NewsletterMailer < ActionMailer::Base
    default from: Maktoub.from,
            parts_order: ['text/html', 'text/plain']

    default_url_options[:host] = Maktoub.home_domain

    def publish(newsletter_name, params)
      @name = params[:name]
      @subject = newsletter_name.humanize.titleize
      @email = params[:email]
      @newsletter_name = newsletter_name

      mail(
        subject: @subject,
        to: params[:email],
        with_html_string: true,
        link_query_string: "utm_source=newsletter&utm_medium=email&utm_campaign=#{CGI.escape(@subject)}",
        template_path: 'maktoub/newsletters',
        template_name: newsletter_name
      )
    end
  end
end
