namespace :maktoub do
  desc 'send :newsletter to the configured from address'
  task :test, [:newsletter] => [:environment] do |_t, args|
    params = { email: Maktoub.from, name: 'Joe Tester' }

    if Maktoub::NewsletterMailer.method_defined? :delay
      Maktoub::NewsletterMailer.delay(priority: 5, queue: 'maktoub')
        .publish(args[:newsletter], params)
    else
      Maktoub::NewsletterMailer.publish(args[:newsletter], params).deliver
    end

    puts "delivered #{Maktoub.from}"
  end

  desc 'send :newsletter to all subscribers'
  task :mail, [:newsletter] => [:environment] do |_t, args|
    puts 'starting...'

    messages = Maktoub.subscribers.map do |u|
      params = {
        email: u.send(Maktoub.email_field), name: u.send(Maktoub.name_field)
      }

      if Maktoub::NewsletterMailer.method_defined? :delay
        Maktoub::NewsletterMailer.delay(priority: 5, queue: 'maktoub')
        .publish(args[:newsletter], params)
      else
        Maktoub::NewsletterMailer.publish(args[:newsletter], params).deliver
      end

      "delivered #{u.send Maktoub.email_field}"
    end

    puts "#{messages.length} messages"
    puts messages.join("\n")
  end
end
