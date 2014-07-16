class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Registration is closed'
    redirect_to root_path
  end
  
  def create
    flash[:info] = 'Registration is closed'
    redirect_to root_path
  end
  
 
end