class Authentication < ActiveRecord::Base

belongs_to :user
# validates :provider, :uid, :presence => true

def self.from_omniauth(auth)
	#byebug

        email =  auth[:email]
        #first_name = auth[:first_name].present? ? auth[:first_name] :  auth[:info][:name].split(" ").first rescue nil


    authenticate = where(provider: auth[:provider], :uid=>auth[:uid]).first_or_initialize
    if authenticate.user
      authenticate.provider = auth[:provider]
      authenticate.uid =auth[:uid]

    else

        user = User.find_or_initialize_by(:email => email)
        authenticate.provider = auth[:provider]
        authenticate.uid = auth[:uid]
        authenticate.token = auth[:token]

        #user.first_name = first_name
       user.password = auth[:password]

        user.save(validate: false)
        authenticate.user_id = user.id

        # if user.errors.any?
        #   return user
        # else
        # authenticate.user_id = user.id
        # end
        # UserMailer.facebook_authentication(user).deliver
     end
    authenticate.save
    authenticate.user

  end
end 