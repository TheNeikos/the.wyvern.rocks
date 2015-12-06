class TopicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def can_b_accessed
    record.category.can_be_accessed_by?(user)
  end

  def show?
    can_b_accessed || super
  end

  def create?
    can_b_accessed && user || super # Either we're an admin, or we are not logged in
  end

  def update?
    can_b_accessed && record.user == user || super
  end

  def destroy?
    can_b_accessed && record.user == user || super
  end
end
