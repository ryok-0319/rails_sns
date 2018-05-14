FactoryBot.define do
  factory :reply do
    content 'ホゲホゲ'
    level 0
    tweet { create(:tweet) }
    user {create(:user_2)}
  end

  factory :reply_2, parent: :reply do
    tweet { create(:tweet_3) }
    user {create(:user_5)}
  end
end
