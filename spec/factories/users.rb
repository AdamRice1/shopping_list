FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    password { "" }
    user_level { 1 }
    account_owner { nil }
  end
end
