require 'rails_helper'

RSpec.describe "sessionsコントローラのテスト" do
  let(:department) { FactoryBot.create(:department)}
  let(:office) { FactoryBot.create(:office)}
  let(:employee) { create(:employee, department_id: department.id, office_id: office.id)}

  describe "表示のテスト" do
    describe "ログイン前" do
      it "ログインページにアクセスできる" do
        get login_path
        expect(response).to be_successful
      end
      it "employees/indexにアクセスするとloginにリダイレクト" do
        get employees_path
        expect(response).to redirect_to login_path
      end
      it "articles/indexにアクセスするとloginにリダイレクト" do
        get articles_path
        expect(response).to redirect_to login_path
      end
    end
  end

  # describe "ログインテスト" do
  #   it "正しい値" do
  #     visit login_path
  #     fill_in "account", with: employee.account
  #     fill_in "password", with: employee.password
  #     find('input[name="commit"]').click
  #     expect(employee.logged_in?).to eq true;
  #   end
  # end

  # describe "ログイン済" do
  #   before do
  #     login(employee)
  #   end
  #   it "loginページにアクセスするとemployees/indexにリダイレクト" do
  #     get login_path
  #     expect(response).to redirect_to employees_path
  #   end
  # end
end