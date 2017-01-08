class ApplicationMailer < ActionMailer::Base

  add_template_helper(UsersHelper)
  
  default from: 'no-reply@gmail.com'
  layout 'mailer'
end
