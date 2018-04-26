require 'rails_helper'
RSpec.describe Admin, type: :model do
  context 'when the data is valid' do
    subject { build(:admin) }
    it 'is registerable' do
      expect(subject.save).to be_truthy
    end
  end

  context 'when the data already exists' do
    subject { create(:admin) }
    it 'is editable' do
      subject.email = 'piyo@email.com'
      expect(subject.save).to be_truthy
    end
    it 'is deletable' do
      expect(subject.destroy).to be_truthy
    end
  end

  describe 'error check' do
    context 'when there is no input' do
      subject { Admin.new }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:email].size).to eq(1)
        expect(subject.errors[:password].size).to eq(1)
      end
    end
  end

  describe 'email' do
    context 'when improper' do
      subject { build(:admin, email: 'invalid_email') }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:email].size).to eq(1)
      end
    end

    context 'when duplicate' do
      before do
        create(:admin)
      end
      subject { build(:admin) }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:email].size).to eq(1)
      end
    end
  end

  describe 'password' do
    context 'when not matching with password confirmation' do
      subject { build(:admin_invalid_password) }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:password_confirmation].size).to eq(1)
      end
    end

    context 'when too short' do
      subject { build(:admin, password: 'a') }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:password].size).to eq(1)
      end
    end
  end
end
