class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.create(inquiry_params)
    if @inquiry.save
      flash[:notice] = "<b>Gracias por tu mensaje.</b><br/><br/> En breve te responderemos."
    else
      flash[:notice] = "<b>Ups, no pudimos guardar tu mensaje.</b><br/><br/>Asegúrate de llenar todos los campos."
    end
    
    redirect_to artwork_path(@inquiry.artwork_id)
  end
  
  protected
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message, :artwork_id)
  end
end
