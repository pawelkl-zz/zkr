# -*- encoding : utf-8 -*-
class NotificationsMailer < ActionMailer::Base
  default from: "Formularz kontaktowy <biuro@zlobekkubusiowyraj.pl>"
  default to: "Biuro <biuro@zlobekkubusiowyraj.pl>"

  def new_message(message)
    @message = message

    # headers["Reply-to"] = "Biuro <biuro@zlobekkubusiowyraj.pl>"
    # mail(to: "#{message.name} <#{message.email}>",
    #     subject: "[Formularz Kontaktowy] #{message.subject}")

    headers["Reply-to"] = "#{message.name} <#{message.email}>"
    mail(from: "#{message.name} <#{message.email}>",
         subject: "#{message.subject}",
         return_path: "#{message.name} <#{message.email}>")
  end
end
