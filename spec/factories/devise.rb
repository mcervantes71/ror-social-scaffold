FactoryBot.define do
  factory :user, class: 'User', aliases: %i[author commenter] do
    id { 1 }
    name { 'test User' }
    email { 'test@user.com' }
    password { 'qwerty' }
  end

  factory :friend, class: 'User' do
    id { 2 }
    name { 'tester testuser' }
    email { 'terster@user.com' }
    password { 'password' }
  end

  trait :invalid_user do
    id { nil }
    name { 'Inv' }
    email { 'invalid.com' }
    password { 'qwe' }
  end
end
