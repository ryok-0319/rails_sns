FactoryBot.define do
  factory :tweet do
    content 'ホゲホゲなう'
    level 0
    user { create(:user) }
  end

  factory :tweet_2, parent: :tweet do
    user { create(:user_2) }
  end
end
