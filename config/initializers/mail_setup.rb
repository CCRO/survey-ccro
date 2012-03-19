ActionMailer::Base.default_url_options[:host] = "ccro-survey.dev"

ActionMailer::Base.smtp_settings = {
  :address              => "localhost",
  :port                 => 1025,
  :domain               => "ccro.org",
}