class NotificationsMailer < ActionMailer::Base
  default from: "biuro@zlobekkubusiowyraj.pl"
  default to: "biuro@zlobekkubusiowyraj.pl"

  def new_message(message)
    @message = message
    mail(subject: "[YourWebsite.tld] #{message.subject}")
  end
end
