class AttachmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end # Scope
  
  def show?
    user.try(:admin?) || record.ticket.project.has_member?(user)
  end # show?

end # AttachmentPolicy
