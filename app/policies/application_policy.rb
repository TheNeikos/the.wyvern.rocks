class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user

    if @user and @user.is_banned
      raise Pundit::NotAuthorizedError, "You have been banned"
    end

    @record = record
  end

  def index?
    @user.try!(:has_role_root?) || false
  end

  def show?
    @user.try!(:has_role_root?) && scope.where(:id => record.id).exists?
  end

  def create?
    @user.try!(:has_role_root?) || false
  end

  def new?
    create?
  end

  def update?
    @user.try!(:has_role_root?) || false
  end

  def edit?
    update?
  end

  def destroy?
    @user.try!(:has_role_root?) || false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
