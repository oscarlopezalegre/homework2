require 'carrierwave/orm/activerecord'

class Message < ActiveRecord::Base

	belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
    belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
	mount_uploader :attachment, AttachmentUploader


scope :received_messages, -> (recipient_in) do
	where("messages.recipient_id = ? ", recipient_in).order(created_at: :desc)	
#	joins("LEFT JOIN friends ON (messages.sender_id = friends.friend1_id and messages.sender_id=friends.friend2_id)").where("messages.recipient_id = ? AND block=FALSE", recipient_in).order(created_at: :desc)
end


scope :sent_messages, -> (sender_in) do
	where("messages.sender_id = ?", sender_in).order(created_at: :desc)
end

end
