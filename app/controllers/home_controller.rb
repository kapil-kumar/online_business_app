class HomeController < ApplicationController
  def index
  end
  
  def contact
    @contact = Contact.new
  end
  
  def submit_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Submitted Successfully!"
      redirect_to root_path
    else
      flash[:error] = "Submission failed!"
      render :action => :contact
    end
  end
  
  private
  def contact_params
    params.require(:contact).permit!
  end
end
