FactoryBot.define do
  factory :employee do
    association :department
    association :office
    number { |n| n }
    last_name { "RSpec" }
    first_name { "factory_bot" }
    account { |n| "factory_bot-#{n}" }
    password { "hogehoge" }
    email { "factory_bot@example.co.jp" }
    date_of_joining { "2020/10/10" }
    employee_info_manage_auth { 1 }
    news_posting_auth { 1 }
    deleted_at {}
  end

  factory :non_admin_employee do
    association :department
    association :office
    number { |n| "NA-#{n}" }
    last_name { "RSpec" }
    first_name { "factory_bot" }
    account { |n| "NA-factory_bot-#{n}" }
    password { "hogehoge" }
    email { "factory_bot@example.co.jp" }
    date_of_joining { "2020/10/10" }
    # employee_info_manage_auth { nil }
    # news_posting_auth { nil }
    # deleted_at {}
  end

  factory :department do
    name { "test" }
  end

  factory :office do
    name { "test" }
  end
end