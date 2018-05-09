FactoryBot.define do
  factory :tweet_fav do
    tweet { create(:tweet)}
    user { create(:user_2) }
  end
end
