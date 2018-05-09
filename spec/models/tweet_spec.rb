require 'rails_helper'
LONGTWEET = 'ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。ながいツイートでございます。'
RSpec.describe Tweet, type: :model do
  context 'when the data is valid' do
    subject { build(:tweet) }
    it 'is postable' do
      expect(subject.save).to be_truthy
    end
  end

  context 'when the data already exists' do
    subject { create(:tweet) }
    it 'is editable' do
      subject.content = 'ぴよぴよなう'
      expect(subject.save).to be_truthy
    end

    it 'is deletable' do
      expect(subject.destroy).to be_truthy
    end
  end

  describe 'error check' do
    context 'when there is no input' do
      subject { Tweet.new }
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:content].size).to eq(1)
      end
    end

    context 'when too long' do
      subject {build(:tweet, content: LONGTWEET)}
      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:content].size).to eq(1)
      end
    end
  end

  describe '#unviewable?' do
    before do
      @tweet = create(:tweet)
      @user2 = create(:user_2)
    end

    context 'when the tweet is to all' do
      it 'returns false' do
        expect(@tweet.unviewable?(@user2)).to be_falsey
      end
    end

    context 'when the tweet is to followers and the user is not following the poster' do
      before do
        @tweet.level = 1
      end
      it 'returns true' do
        expect(@tweet.unviewable?(@user2)).to be_truthy
      end
    end

    context 'when the tweet is to followers and the user is following the poster' do
      before do
        @tweet.level = 1
        @user2.follow!(@tweet.user)
      end
      it 'returns false' do
        expect(@tweet.unviewable?(@user2)).to be_falsey
      end
    end

    context 'when the tweet is to himself and the user is the one who posted the tweet' do
      before do
        @tweet.level = 2
      end
      it 'returns false' do
        expect(@tweet.unviewable?(@tweet.user)).to be_falsey
      end
    end

    context 'when the tweet is to himself and the user is not the one who posted the tweet' do
      before do
        @tweet.level = 2
      end
      it 'returns true' do
        expect(@tweet.unviewable?(@user2)).to be_truthy
      end
    end
  end

  describe '#fav_added?' do
    context 'when the tweet is added to fav by a certain user' do
      before do
        @tweet_fav = create(:tweet_fav)
      end
      it 'returns true' do
        expect(@tweet_fav.tweet.fav_added?(@tweet_fav.user)).to be_truthy
      end
    end

    context 'when the tweet is not added to fav by a certain user' do
      before do
        @tweet = create(:tweet)
        @user2 = create(:user_2)
      end
      it 'returns false' do
        expect(@tweet.fav_added?(@user2)).to be_falsey
      end
    end
  end

  describe '.permitted_tweet' do
    before do
      @tweet1 = create(:tweet)
      @tweet2 = create(:tweet_2, level: 1)
      @user3 = create(:user_3)
    end
    it 'returns tweets viewable for a certain user' do
      expect(Tweet.permitted_tweet(@user3).size).to eq(1)
      expect(Tweet.permitted_tweet(@user3).include?(@tweet1)).to be_truthy
    end
  end
end
