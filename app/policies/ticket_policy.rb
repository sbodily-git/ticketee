class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end # Scope
  
  def show?
    user.try(:admin?) || record.project.roles.exists?(user_id: user)
  end # show?

  def create?
    user.try(:admin?) || record.project.has_manager?(user) ||
      record.project.has_editor?(user)
  end # create?

  def update?
    user.try(:admin?) || record.project.has_manager?(user) ||
      (record.project.has_editor?(user) && record.author == user)
  end # update?

end # TicketPolicy
