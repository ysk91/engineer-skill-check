require 'rails_helper'

RSpec.describe "sessionsコントローラのテスト" do
  let(:department) { FactoryBot.create(:department)}
  let(:office) { FactoryBot.create(:office)}
  let(:employee) { create(:employee, department_id: department.id, office_id: office.id)}

  describe "表示のテスト" do
    describe "ログイン前" do
      it "ログインページにアクセスできる" do
        pending "Webpackerがapplication.jsを参照できないエラー"
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
    describe "ログイン後" do
      before do
        login(employee)
      end
      it "ログインしていることの確認" do
        expect(session[:user_id]).to eq(employee.id)
      end
      it "loginページにアクセスするとemployees/indexにリダイレクトする" do
        get login_path
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "CRUDのテスト" do
    it "createができる" do
      post login_path, params: { employees: {
        account: employee.account,
        password: employee.password
      } }
      expect(session[:user_id]).to eq(employee.id)
    end
    it "間違ったパスワードはcreateできない" do
      pending "Webpackerがapplication.jsを参照できないエラー"
      post login_path, params: { employees: {
        account: employee.account,
        password: "fugafuga"
      } }
      expect(session[:user_id].nil?).to eq true;
    end
    it "deleteができる" do
      post login_path, params: { employees: {
        account: employee.account,
        password: employee.password
      } }
      delete logout_path
      expect(session[:user_id].nil?).to eq true;
    end
  end
end