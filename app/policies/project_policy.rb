class ProjectPolicy < ApplicationPolicy

  class Scope < Scope
  
    def resolve
      scope
    end # resolve
    
  end # Scope
  
  def show?
    user.try(:admin?) || record.roles.exists?(user_id: user)
  end # show?
  
end # ProjectPolicy
