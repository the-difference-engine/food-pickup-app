ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.mailgun.org",
  :port                   => ENV['MAILGUN_SMTP_PORT'],
  :authentication         => :plain,
  :user_name =>  ENV['MAILGUN_SMTP_LOGIN'],
  :password =>   ENV['MAILGUN_SMTP_PASSWORD'],
  :domain                 => ENV['MAILGUN_DOMAIN'],
  :enable_starttls_auto   => false
}
