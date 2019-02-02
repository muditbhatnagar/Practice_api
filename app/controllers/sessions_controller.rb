class SessionsController < ApplicationController

	def google_login
	byebug 
	  user = Authentication.from_omniauth(request.env["omniauth.auth"])
	      if user
		flash[:notice] = "Authentication successful."
		sign_in(user)
		sign_in_and_redirect(user)
	      else
		  flash[:notice] = "Authentication Failed."
	      end
	    end
	end

  def new
  end


  def failure
  end
end
