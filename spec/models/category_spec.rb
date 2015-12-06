require 'rails_helper'

RSpec.describe Category, :type => :model do
  let :category do
    create :category
  end
  subject do
    category
  end

  context 'is valid' do
    it 'when default factory user is given' do
      expect(category).to be_valid
    end
  end

  context 'is invalid' do
    it 'when names are not unique' do
      category2 = Category.new name: category.name
      expect(category2).to_not be_valid
    end
  end
end
