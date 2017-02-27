ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.mailgun.org",
  :port                   => 587,
  :authentication         => :plain,
  :user_name =>  ENV['MAILGUN_SMTP_LOGIN'],
  :password =>   ENV['MAILGUN_SMTP_PASSWORD'],
  :domain                 => 'rlc-qa.herokuapp.com',
  :enable_starttls_auto   => true
}
