class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def can_b_accessed
    record.topic.category.can_be_accessed_by?(user)
  end

  def show?
    can_b_accessed || super
  end

  def create?
    @user && can_b_accessed || super
  end

  def update?
    @user == record.user || super
  end

  def destroy?
    @user == record.user || super
  end

end
