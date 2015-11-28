class User < ActiveRecord::Base
  has_secure_password
  has_paper_trail

  has_many :user_roles, dependent: :destroy
  has_many :roles, -> { distinct }, through: :user_roles

  has_many :sessions

  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: /@/ }
  validates :name, presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 1, maximum: 25 }, format: { with: /\A\S.*\S\z/}
  validates :password, presence: true, on: :create,
            length: { minimum: 2, maximum: 4096 }

  validate :role_length

  before_validation on: :create do
    roles << Role.find_or_create_by(name: "User")
  end

  def can_access? other
    other.roles.empty? or (not (other.roles & self.roles).empty? and not other.roles.empty?)
  end

  def has_role_root?
    !roles.find_by_name("root").nil?
  end

  private

  def role_length
    errors.add(:roles, "need to be present") if roles.size < 1
  end
end
