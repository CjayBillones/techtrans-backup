class ApplicationMailer < ActionMailer::Base

  add_template_helper(UsersHelper)
  
  default from: 'noreply@example.com'
  layout 'mailer'
end
