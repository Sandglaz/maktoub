require 'premailer'

module Maktoub
  class NewsletterMailer < ActionMailer::Base
    default from: Maktoub.from,
            parts_order: %w(text/plain text/html),
            'List-Unsubscribe' => Maktoub.subscription_preferences_url

    default_url_options[:host] = Maktoub.home_domain

    def publish(newsletter_name, params)
      template_data = Maktoub.template_data.try(:[], newsletter_name.to_sym) || {}

      @name = params[:name]
      @subject = template_data[:subject] || newsletter_name.humanize.titleize
      @subcaption = template_data[:subcaption]
      @email = params[:email]
      @newsletter_name = newsletter_name

      send_mail(newsletter_name, params)
    end

    private

    def send_mail(newsletter_name, params)
      link_query_string = 'utm_source=newsletter&utm_medium=email&' \
                          "utm_campaign=#{CGI.escape(@subject)}"

      mail subject: @subject,
           to: params[:email],
           with_html_string: true,
           link_query_string: link_query_string,
           template_path: 'maktoub/newsletters',
           template_name: newsletter_name
    end
  end
end
