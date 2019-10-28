FactoryBot.define do
  factory :account_owner do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    password { "" }
    user_level { 1 }
  end
end
