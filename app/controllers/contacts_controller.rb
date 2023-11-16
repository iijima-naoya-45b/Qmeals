class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to root_path, flash: { success: 'お問い合わせに成功しました' }
    else
      flash.now[:danger] = 'お問い合わせに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message, :email)
  end
end
