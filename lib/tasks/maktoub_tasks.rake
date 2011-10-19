namespace :maktoub do
  desc "send :newsletter to the configured from address"
  task :test, [:newsletter] => [:environment] do |t, args|
    if Maktoub::NewsletterMailer.method_defined? :delay
      Maktoub::NewsletterMailer.delay(:priority => -5).publish(args[:newsletter], :email => Maktoub.from, :name => 'Joe Tester')
      puts "delayed #{Maktoub.from}"
    else
      Maktoub::NewsletterMailer.publish(args[:newsletter], :email => Maktoub.from, :name => 'Joe Tester').deliver
      puts "delivered #{Maktoub.from}"
    end
  end

  desc "send :newsletter to all subscribers"
  task :mail, [:newsletter] => [:environment] do |t, args|
    Maktoub.subscribers.each do |u|
      if Maktoub::NewsletterMailer.method_defined? :delay
        Maktoub::NewsletterMailer.delay(:priority => -5).publish(args[:newsletter], :email => u[:email], :name => u[:name])
        puts "delayed #{u[:email]}"
      else
        Maktoub::NewsletterMailer.publish(args[:newsletter], :email => u[:email], :name => u[:name]).deliver
        puts "delivered #{u[:email]}"
      end
    end
  end
end

