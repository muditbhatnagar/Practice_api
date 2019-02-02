class Song < ApplicationRecord
	#belongs_to :user
	mount_uploader :song, AvatarUploader
end
