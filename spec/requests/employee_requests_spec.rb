require 'rails_helper'

RSpec.describe "employeesコントローラのテスト" do
  let(:employee) { create(:employee) }

  describe "表示のテスト" do
    describe "ログイン後" do
      before do
        login employee
      end
      it "indexを正常に表示すること" do
        pending "Webpackerがapplication.jsを参照できないエラー"
        get employees_path
        expect(response).to be_successful
      end
    end
    
    describe "ログイン前" do
      it "ログイン前にemployees/indexにアクセスするとroot_pathにリダイレクトすること" do
        get employees_path
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "CRUDのテスト" do
    let(:test_employee) { create(:employee) } # 削除する用のユーザーを作る
    describe "認証済ユーザーとして" do
      before do
        login(employee)
      end
      it "createできること" do
        pending "Webpackerがapplication.jsを参照できないエラー"
        expect{
        post employees_path, params: { employee: {
          number: "E-001",
          last_name: "RSpec",
          first_name: "employee_request",
          account: "employee_request",
          password: "hogehoge",
          email: "employee_request@example.co.jp",
          date_of_joining: "2020/10/10",
          employee_info_manage_auth: 1,
          news_posting_auth: 1,
          deleted_at: nil # 明示的にnil
        } }
        }.to change{ Employee.count }.by(1)
      end
      it "deleteできること" do
        pending "通らない"
        expect{
          delete employee_path(test_employee)
        }.to change{ test_employee.deleted_at.nil? }.by(false)
      end
    end
    describe "未認証のユーザーとして" do
      # 画面上に表示されていないだけで、未認証でもcreateとdeleteはできる？
    end
  end
end