class Api::V1::UsersController < Api::V1::ApiController
	#before_action :authenticate_user!
	protect_from_forgery with: :null_session
	skip_before_action :verify_authenticity_token
	respond_to :json


	def index
	 #byebug
		@users = User.all
    @users = @users.paginate(:page => params[:page], :per_page => 7)
    render json: {status: 200, data: { :users => @users.as_json}, :message =>"Successfuly Listed Users"}
	end

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

  def show
    respond_with User.find(params[:id])
  end

  def update
		 #byebug
		user = User.find(params[:id])
		user.update(user_params)
		if user.save
			render json: {status: 201, data: {user: user}, :message => "Successfully Updated"}
		else
			render json: {errors: user.errors}, status: 422
		end		
	end

	def destroy
		#byebug
		user = User.find(params[:id])
		user.destroy
		if user.destroy
			render json: {status: 201, data: {user: user}, :message => "Successfully Deleted"}
		else
		end	
	end

	def profile
			#byebug
		if current_user.role == "admin"
			user = user.present? ? user : current_user
				render json: {status: 201, data: {user: user}, :message => "Your Profile"}
		else
			user = user.present? ? user : current_user.name, user.present? ? user : current_user.email
				render json: {status: 201, data: {user: user}, :message => "Your Profile is not permit to see role"}
		end		
	end
		
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation) 
  end

end
