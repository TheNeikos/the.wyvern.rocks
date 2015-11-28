class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # FIXME: Get this into the Database instead of Ruby....
      scope.includes(:roles).to_a.delete_if{|x| !x.can_be_accessed_by?(user)}
    end
  end

  def show?
    record.can_be_accessed_by?(@user) || super
  end
end
