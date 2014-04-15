class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.valid?
      ContactMailer.send_form(@contact).deliver
      flash[:notice] = "Your message has been sent. Thank You."
      redirect_to root_path
    else
      @errors = @contact.errors.messages
      render :new
    end 
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :number, :preferred_date, :backup_date, :session_type, :referral, :message, :nickname)
  end
end