class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to root_path, success: 'お問い合わせ内容を送信しました'
    else
      flash.now[:danger] = 'お問い合わせに失敗しました'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message, :email)
  end
end
