FactoryBot.define do
  factory :article do
    association :employee
    title { "test" }
    content { "test" }
  end
end