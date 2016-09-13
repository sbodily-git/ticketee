class ProjectPolicy < ApplicationPolicy

  class Scope < Scope
  
    def resolve
      return scope.none if user.nil?
      return scope.all if user.admin?

      scope.joins(:roles).where(roles: {user_id: user})
      # scope is the argument of the policy_scope call
    end # resolve
    
  end # Scope
  
  def show?
    user.try(:admin?) || record.roles.exists?(user_id: user)
  end # show?
  
end # ProjectPolicy
