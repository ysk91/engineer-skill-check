require 'rails_helper'

RSpec.describe "employeesコントローラのテスト" do
  let(:department) { FactoryBot.create(:department)}
  let(:office) { FactoryBot.create(:office)}
  let(:employee) { create(:employee, department_id: department.id, office_id: office.id)}

  describe "表示のテスト" do
    before do
      login employee
    end
    it "ログインしていること" do
      expect(employee.logged_in?).to eq true;
    end
    # it "indexを正常に表示すること" do
    #   get employees_path
    #   expect(response).to_be_successful
    # end
    # it "editを正常に表示すること" do
    #   get edit_employee_path
    #   expect(response).to_be_successful
    # end
  end

  # describe "CRUDのテスト" do
  #   before do
  #     login(employee)
  #   end
  #   it "createのテスト" do
  #     post employees_path
  #     params { employee: {
  #       number: { "S-001" }
  #       last_name: { "RSpec" }
  #       first_name: { "factory_bot" }
  #       account: { "factory_bot" }
  #       password: { "hogehoge" }
  #       email: { "factory_bot@example.co.jp" }
  #       date_of_joining: { "2020/10/10" }
  #       employee_info_manage_auth: { 1 }
  #       news_posting_auth: { 1 }
  #     } }
  #     expect(Employee.count).to change.by(1)
  #   end
  #   it "updateのテスト" do
  #     patch employee_path(employee)
  #     params { employee: {
  #       number: { "S-001" }
  #       last_name: { "RSpec" }
  #       first_name: { "factory_bot" }
  #       account: { "factory_bot" }
  #       password: { "hogehoge" }
  #       email: { "factory_bot@example.co.jp" }
  #       date_of_joining: { "2020/10/10" }
  #       employee_info_manage_auth: { 1 }
  #       news_posting_auth: { 1 }
  #     } }
  #     reload employee
  #   end
  #   it "destroyのテスト" do
  #     delete employee_path(employee)
  #     reload employee
  #     expect(employee.deleted_at.nil?).to eq true;
  #   end
  # end
end