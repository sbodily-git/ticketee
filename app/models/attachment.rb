class Attachment < ActiveRecord::Base
  belongs_to :ticket

  mount_uploader :file, AttachmentUploader
  
  def show?
    user.try(:admin?) || record.ticket.project.has_member?(user)
  end # show?
  
end # Attachment
