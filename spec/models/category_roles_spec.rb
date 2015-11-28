require 'rails_helper'

RSpec.describe CategoryRole, :type => :model do
  let :category do
    create :category
  end

  let :restricted_category do
    create :category, :restricted
  end

  let :user do
    create :user
  end

  let :restricted_user do
    create :user, :restricted
  end

  context 'user does not have restricted' do
    it 'when category is not restricted' do
      expect(category.can_be_accessed_by?(user)).to be true
    end
    it 'when category is restricted' do
      expect(restricted_category.can_be_accessed_by?(user)).to be false
    end
  end
  context 'user does have restricted' do
    it 'when category is not restricted' do
      expect(category.can_be_accessed_by?(restricted_user)).to be true
    end
    it 'when category is restricted' do
      expect(restricted_category.can_be_accessed_by?(restricted_user)).to be true
    end
  end
end

