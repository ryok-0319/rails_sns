FactoryBot.define do
  factory :reply_fav do
    reply { create(:reply)}
    user { create(:user_3) }
  end
end
