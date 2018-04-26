FactoryBot.define do
  factory :admin do
    email 'hoge@gmail.com'
    password 'aaaaaa'
    password_confirmation 'aaaaaa'
  end

  factory :admin_invalid_password, parent: :user do
    password 'invalid_password'
    password_confirmation 'wrong_password'
  end
end
