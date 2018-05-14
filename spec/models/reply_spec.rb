require 'rails_helper'
LONGREPLY = 'ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。'
RSpec.describe Reply, type: :model do
  context 'when the data is valid' do
    subject { build(:reply) }
    it 'is postable' do
      expect(subject.save).to be_truthy
    end
  end

  context 'when the data already exists' do
    subject { create(:reply) }
    it 'is editable' do
      subject.content = 'ぴよぴよ'
      expect(subject.save).to be_truthy
    end

    it 'is deletable' do
      expect(subject.destroy).to be_truthy
    end
  end

  describe 'error check' do
    context 'when there is no input' do
      subject { Reply.new }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:content].size).to eq(1)
      end
    end

    context 'when too long' do
      subject {build(:reply, content: LONGREPLY)}
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:content].size).to eq(1)
      end
    end
  end

  describe '#unviewable?' do
    before do
      @reply = create(:reply)
      @user3 = create(:user_3)
    end

    context 'when the reply is to all' do
      it 'returns false' do
        expect(@reply.unviewable?(@user3)).to be_falsey
      end
    end

    context 'when the reply is to followers and the user is not following the poster' do
      before do
        @reply.level = 1
      end
      it 'returns true' do
        expect(@reply.unviewable?(@user3)).to be_truthy
      end
    end

    context 'when the reply is to followers and the user is following the poster' do
      before do
        @reply.level = 1
        @user3.follow!(@reply.user)
      end
      it 'returns false' do
        expect(@reply.unviewable?(@user3)).to be_falsey
      end
    end

    context 'when the reply is to himself and the user is the one who posted the reply' do
      before do
        @reply.level = 2
      end
      it 'returns false' do
        expect(@reply.unviewable?(@reply.user)).to be_falsey
      end
    end

    context 'when the reply is to himself and the user is not the one who posted the reply' do
      before do
        @reply.level = 2
      end
      it 'returns true' do
        expect(@reply.unviewable?(@user3)).to be_truthy
      end
    end
  end

  describe '#fav_added?' do
    context 'when the reply is added to fav by a certain user' do
      before do
        @reply_fav = create(:reply_fav)
      end
      it 'returns true' do
        expect(@reply_fav.reply.fav_added?(@reply_fav.user)).to be_truthy
      end
    end

    context 'when the reply is not added to fav by a certain user' do
      before do
        @reply = create(:tweet)
        @user3 = create(:user_3)
      end
      it 'returns false' do
        expect(@reply.fav_added?(@user3)).to be_falsey
      end
    end
  end

  describe '.permitted_reply' do
    before do
      @reply1 = create(:reply)
      @reply2 = create(:reply_2, level: 1)
      @user4 = create(:user_4)
    end
    it 'returns replies viewable for a certain user' do
      expect(Reply.permitted_reply(@reply1.tweet, @user4).size).to eq(1)
      expect(Reply.permitted_reply(@reply1.tweet, @user4).include?(@reply1)).to be_truthy
    end
  end
end
