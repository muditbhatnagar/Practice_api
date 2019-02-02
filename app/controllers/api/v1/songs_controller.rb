class Api::V1::SongsController < Api::V1::ApiController
	protect_from_forgery with: :null_session
	respond_to :json

	def index
    @songs = Song.all
  end

  def create
  	#byebug
    song = Song.new(song_params)
	    if song.save
	      return render json: {status: 200, data: {song: song}, :message =>"Song Successfuly Created"}
	    else
	      warden.custom_failure!
	      return render json: {status: 401, data: {song: nil, errors: song.errors}, :message =>"Song Not Created"}
	    end
  end 


  private
  def song_params
    params.require(:song).permit(:upload_song, :user_id)
  end

end