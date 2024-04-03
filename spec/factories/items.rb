FactoryBot.define do
  factory :user do
    name                  {'test'}
    last_name             {'バズーカ'}
    first_name            {'岡田'}
    last_name_kana        {'バズーカ'}
    first_name_kana       {'オカダ'}
    birth                 {Faker::Date.birthday}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    is_logged_in { true }


    factory :logged_out_user do
      is_logged_in { false }
    end
  end
end
