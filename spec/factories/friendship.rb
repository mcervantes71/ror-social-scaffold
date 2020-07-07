FactoryBot.define do
  factory :friendship do
    trait :confirmed do
      user_id { 1 }
      friend_id { 2 }
      confirmed { true }
    end

    trait :rejected do
      user_id { 1 }
      friend_id { 2 }
      confirmed { false }
    end

    trait :pending do
      user_id { 1 }
      friend_id { 2 }
    end
  end
end
