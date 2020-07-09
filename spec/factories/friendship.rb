FactoryBot.define do
  factory :friendship do
    trait :confirmed do
      user_id { 1 }
      friend_id { 2 }
      status { 'Confirmed' }
    end

    trait :requested do
      user_id { 1 }
      friend_id { 2 }
      status { 'Requested' }
    end

    trait :pending do
      user_id { 1 }
      friend_id { 2 }
      status { 'Pending' }
    end
  end
end
