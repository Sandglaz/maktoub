namespace :maktoub do
  desc "send :newsletter to the configured from address"
  task :test, [:newsletter] => [:environment] do |t, args|
    if Maktoub::NewsletterMailer.method_defined? :delay
      Maktoub::NewsletterMailer.delay(:priority => -5).publish(args[:newsletter], :email => Maktoub.from, :name => 'Joe Tester')
    else
      Maktoub::NewsletterMailer.publish(args[:newsletter], :email => Maktoub.from, :name => 'Joe Tester').deliver
    end
  end

  desc "send :newsletter to all subscribers"
  task :mail, [:newsletter] => [:environment] do |t, args|
    Maktoub.subscribers.each do |u|
      if Maktoub::NewsletterMailer.method_defined? :delay
        Maktoub::NewsletterMailer.delay(:priority => -5).publish(args[:newsletter], :email => u[:email], :name => u[:name])
      else
        Maktoub::NewsletterMailer.publish(args[:newsletter], :email => u[:email], :name => u[:name]).deliver
      end
    end
  end
end

