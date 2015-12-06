require 'rails_helper'

RSpec.describe Post, :type => :model do
  let (:post) { build :post }


  context 'is valid' do
    it 'when factories is used' do
      expect(post).to be_valid
    end
  end

  context 'is invalid' do
    it 'when user is not given' do
      post.user = nil
      expect(post).to_not be_valid
    end
    it 'when topic is not given' do
      post.topic = nil
      expect(post).to_not be_valid
    end
    it 'when content is not given' do
      post.content = nil
      expect(post).to_not be_valid
    end
  end
end
