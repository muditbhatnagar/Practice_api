class Api::V1::SessionsController < Api::V1::ApiController
	protect_from_forgery with: :null_session
	 skip_before_action :verify_authenticity_token

	# def google_login
	# 	byebug 
	#   user = Authentication.from_omniauth(request.env["omniauth.auth"])
  #    if user
	# 		flash[:notice] = "Authentication successful."
	# 		sign_in(user)
	# 		sign_in_and_redirect(user)
  #    else
	#   	flash[:notice] = "Authentication Failed."
  #    end
	# end
	def google_login
		#byebug
    return render json: {status:401, message: "Provider required"} if params[:provider].blank?
    return render json: {status:401, message: "OAuth access token required"} if params[:token].blank?
    return render json: {status:401, message: "Provider Not Available"} unless params[:provider] == "facebook" || params[:provider] == "twitter" || params[:provider] == "linkedin" || params[:provider] == "google"
      # url = 'https://graph.facebook.com/v2.7/me'

    user = Authentication.from_omniauth(params)
    if user
      render json: {:status => 200, :user=>user.as_json().merge(

          authentication: user.authentications,
        ), :message =>"Login Successful"}
    else
      render :json=> user.errors.full_messages, :status=>401
    end
  end 

  def new
  end


  def failure
  end
end
