require 'rails_helper'

RSpec.describe "employeesコントローラのテスト" do
  let(:department) { FactoryBot.create(:department)}
  let(:office) { FactoryBot.create(:office)}
  let(:employee) { build(:employee, department_id: department.id, office_id: office.id)}

  describe "表示のテスト" do
    before do
      login employee
    end
    it "indexを正常に表示すること" do
      get employees_path
      expect(response).to_be_successful
    end
  end

  describe "CRUDのテスト" do
    describe "createのテスト" do

    end
  end
end