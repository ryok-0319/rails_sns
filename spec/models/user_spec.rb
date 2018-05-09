require 'rails_helper'
RSpec.describe User, type: :model do
  context 'when the data is valid' do
    subject { build(:user) }
    it 'is registerable' do
      expect(subject.save).to be_truthy
    end
  end

  context 'when the data already exists' do
    subject { create(:user) }
    it 'is editable' do
      subject.nickname = 'ほげまるくん'
      expect(subject.save).to be_truthy
    end
    it 'is deletable' do
      expect(subject.destroy).to be_truthy
    end
  end

  describe 'error check' do
    context 'when there is no input' do
      subject { User.new }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:name].size).to eq(2)
        expect(subject.errors[:nickname].size).to eq(1)
        expect(subject.errors[:email].size).to eq(1)
        expect(subject.errors[:password].size).to eq(1)
      end
    end
  end

  describe 'name' do
    context 'when including 2-bytes characters' do
      subject { build(:user, name: '全角くん') }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:name].size).to eq(1)
      end
    end

    context 'when too long' do
      subject { build(:user, name: 'longlonglonglongname')}
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:name].size).to eq(1)
      end
    end

    context 'when duplicate' do
      before do
        create(:user)
      end
      subject { build(:user) }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:name].size).to eq(1)
      end
    end
  end

  describe 'nickname' do
    context 'when too long' do
      subject { build(:user, nickname: '長くたっていいじゃない名前だもの') }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:nickname].size).to eq(1)
      end
    end
  end

  describe 'email' do
    context 'when improper' do
      subject { build(:user, email: 'invalid_email') }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:email].size).to eq(1)
      end
    end

    context 'when duplicate' do
      before do
        create(:user)
      end
      subject { build(:user) }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:email].size).to eq(1)
      end
    end
  end

  describe 'password' do
    context 'when not matching with password confirmation' do
      subject { build(:user_invalid_password) }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:password_confirmation].size).to eq(1)
      end
    end

    context 'when too short' do
      subject { build(:user, password: 'a') }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:password].size).to eq(1)
      end
    end
  end

  describe '#following?' do
    before do
      @user = create(:user)
      @user2 = create(:user_2)
    end

    context 'when following' do
      it 'returns true' do
        @user.follow!(@user2)
        expect(@user.following?(@user2)).to be_truthy
      end
    end

    context 'when not following' do
      it 'returns false' do
        expect(@user.following?(@user2)).to be_falsey
      end
    end
  end

  describe '#follow!' do
    before do
      @user = create(:user)
      @user2 = create(:user_2)
    end

    it 'is followable' do
      expect(@user.follow!(@user2)).to be_truthy
      expect(@user.following?(@user2)).to be_truthy
    end
  end

  describe '#unfollow!' do
    before do
      @user = create(:user)
      @user2 = create(:user_2)
      @user.follow!(@user2)
    end

    it 'is removable' do
      expect(@user.unfollow!(@user2)).to be_truthy
      expect(@user.following?(@user2)).to be_falsey
    end
  end
end
