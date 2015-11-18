class SessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    @user.nil?
  end

  def destroy?
    @user || super
  end
end
