FactoryBot.define do
  factory :list do
    item { "MyString" }
    quantity { 1 }
    account_owner { nil }
    user { nil }
  end
end
