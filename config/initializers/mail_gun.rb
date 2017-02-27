ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.mailgun.org",
  :port                   => 587,
  :authentication         => :plain,
  :user_name =>  ENV['MAILGUN_USERNAME'],
  :password =>   ENV['MAILGUN_PASSWORD'],
  :domain                 => 'rlc-qa.herokuapp.com',
  :enable_starttls_auto   => true
}
