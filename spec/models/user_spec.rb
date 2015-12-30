require 'rails_helper'

RSpec.describe User do
  let :user do
    create :user
  end
  subject do
    user
  end

  context 'is valid' do
    it 'when default factory user is given' do
      expect(user).to be_valid
    end
    it 'when he gets an existing role' do
      user.roles << Role.find_or_create_by(name: "User")
      expect(user).to be_valid
    end
  end

  context 'is invalid' do
    it 'when required #email is not given' do
      user.email = ''
      expect(user).to_not be_valid
    end
    it 'when #email is not unique' do
      user.save
      user2 = build :user
      user2.email = user.email.upcase
      expect(user2).to_not be_valid
    end
    it 'when required #name is not given' do
      user.name = nil
      expect(user).to_not be_valid
    end
    it 'when #name is not unique' do
      user.save
      user2 = build :user
      user2.name = user.name.upcase
      expect(user2).to_not be_valid
    end
    it 'when required #name is too short' do
      user.name = ''
      expect(user).to_not be_valid
    end
    it 'when required #name is too long' do
      user.name = 'a' * 26
      expect(user).to_not be_valid
    end
    it 'when required #name has consecutive spaces' do
      user.name = ' ' * 20
      expect(user).to_not be_valid
    end
    it 'when required #name begins with spaces' do
      user.name = 'a' + ' ' * 20
      expect(user).to_not be_valid
    end
    it 'when required #name ends with spaces' do
      user.name = ' ' * 20 + 'a'
      expect(user).to_not be_valid
    end
    it 'when required #password is not given' do
      user.password = nil
      expect(user).to_not be_valid
    end
    it 'when #password_confirmation is wrong' do
      user.password_confirmation = ''
      expect(user).to_not be_valid
    end
    it 'when he has no roles' do
      user.roles.clear
      expect(user).to_not be_valid
    end
  end

  context 'can authenticate' do
    it 'when correct password is given' do
      expect(user.authenticate(user.password)).to_not eq false
    end
  end
  context 'cannot authenticate' do
    it 'when incorrect password is given' do
      expect(user.authenticate(user.password + "asdf")).to eq false
    end
  end
end
