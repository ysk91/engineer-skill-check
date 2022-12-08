FactoryBot.define do
  factory :article do
    title { "test" }
    content { "test" }
    employee
  end
end