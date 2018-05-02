FactoryBot.define do
  factory :user do
    email 'hoge@gmail.com'
    name 'hogehoge'
    nickname 'ほげお'
    password 'aaaaaa'
    password_confirmation 'aaaaaa'
  end

  factory :user_invalid_password, parent: :user do
    password 'invalid_password'
    password_confirmation 'wrong_password'
  end

  factory :user_2, parent: :user do
    email 'piyo@gmail.com'
    name  'piyopiyo'
    nickname 'ぴよこ'
  end

  factory :user_3, parent: :user do
    email 'fuga@gmail.com'
    name  'fugafuga'
    nickname 'ふがお'
  end
end
