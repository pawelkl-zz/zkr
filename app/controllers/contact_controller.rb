# -*- encoding : utf-8 -*-
class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Wiadomość została pomyślnie wysłana.")
    else
      flash.now.alert = "Proszę wypełnić wszystkie pola."
      render :new
    end
  end

end
