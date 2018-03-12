class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
    def permission_adm
      if current_user.type == 1
        flash[:error] = 'Acesso Negado'
        redirect_to current_user
      end  
    end
end
