FactoryBot.define do
  factory :employee do
    number { "S-001" }
    last_name { "RSpec" }
    first_name { "factory_bot" }
    account { "factory_bot" }
    password { "hogehoge" }
    email { "factory_bot@example.co.jp" }
    date_of_joining { "2020/10/10" }
    employee_info_manage_auth { 1 }
    news_posting_auth { 1 }
    deleted_at {}
  end

  factory :department do
    name { "test" }
  end

  factory :office do
    name { "test" }
  end
end