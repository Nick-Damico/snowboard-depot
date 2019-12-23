require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user, name: 'Johnny Appleseed', password: '123456789')}
  it 'is valid with a password and name' do
    expect(subject).to be_valid
  end

  describe '#name' do
    context 'to be valid' do
      it 'must be unique' do
        subject.save
        user2 = build(:user, name: subject.name, password: '123456789')
        expect(user2).to_not be_valid
      end

      it 'must not be blank' do
        subject.name = ''
        expect(subject).to_not be_valid
      end
    end
  end

  describe '#password' do
    it 'encypts password' do
      subject.save
      subject_user = User.find_by(name: subject.name)
      expect(subject_user.password).to_not eq '123456789'
    end
  end
end
