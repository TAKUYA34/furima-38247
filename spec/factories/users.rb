FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'1a'+Faker::Internet.password(min_length: 6 )}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_kn         {'ヤマダ'}
    last_name_kn         {'タロウ'}
    birth_id              {'1933-2-4'}
  end
end