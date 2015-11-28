class Category < ActiveRecord::Base
  has_many :category_roles
  has_many :roles, through: :category_roles

  validates :name, uniqueness: { case_sensitive: true }

  def can_be_accessed_by? other
    self.roles.empty? || (other && other.can_access?(self))
  end
end
