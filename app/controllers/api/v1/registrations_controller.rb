class Api::V1::RegistrationsController < Api::V1::ApiController
	 protect_from_forgery with: :null_session
	 skip_before_action :verify_authenticity_token
	def create
		#byebug
	  user = User.new(user_params)
	    # if the user is saved successfully than respond with json data and status code 201
	  if user.save 
	    render json: {status: 201, data: {user: user}, :message => "Successfully Signup"}
	  else
	    render json: { errors: user.errors}, status: 422
	  end
	end

	def update
		byebug
		user = User.find(params[:id])
		if user.update(user_params)
			render jason: {status: 201, data: {user: user}, :message => "Successfully Updated"}
		else
			render jason: {errors: user.errors}, status: 422
		end		
	end

	private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation) 
  end

end