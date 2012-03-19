class UserMailer < ActionMailer::Base
  default from: "joey@ccro.org"
  
  def survey_invite(survey, user)
    @survey = survey
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Survey Invite")
  end
end
