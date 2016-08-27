class Contract < ActiveRecord::Base
	belongs_to :project

	mount_uploader :attachment, AttachmentUploader

end
