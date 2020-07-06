FactoryBot.define do
  factory :user, aliases: [:author, :commenter] do
    id {1}
    name {"test User"}
    email {"test@user.com"}
    password {"qwerty"}
  end
end