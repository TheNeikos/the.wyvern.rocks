class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    @user.nil? || super # Either we're an admin, or we are not logged in
  end

  def update?
    @user == record || super
  end

  def destroy?
    super
  end
end
