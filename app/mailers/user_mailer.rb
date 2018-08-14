class UserMailer < ApplicationMailer


  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Le Wagon Remains')
  end

  def message_user(receiver, sender, message, sell_advert)
    @receiver = receiver
    @sender = sender
    @message = message
    @sell_advert = sell_advert
    mail(from: @sender.email, to: receiver.email, subject: 'Le Wagon Remains - Sell advert', template_name: 'new_email')
  end
end
