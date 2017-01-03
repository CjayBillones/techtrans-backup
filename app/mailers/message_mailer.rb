class MessageMailer < ApplicationMailer

  default from: "noreply@google.com"
  default to: "billonesciprian08@gmail.com"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end

end
