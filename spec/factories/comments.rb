FactoryBot.define do
  factory :comment do
    user_id {1}
    post_id {1}
    content {"Awesome post!"}
  end

  trait :post do
    post_id {1}
  end

  trait :commenter do
    user_id {1}
  end

  trait :invalid_comment do
    content {''}
  end
end
