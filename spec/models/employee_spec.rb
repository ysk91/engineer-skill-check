require 'rails_helper'

RSpec.describe Employee, type: :model do  
  describe "バリデーションのテスト" do
    let(:department) { FactoryBot.create(:department)}
    let(:office) { FactoryBot.create(:office)}
    let(:employee) { build(:employee, department_id: department.id, office_id: office.id)}

    describe "正しい値" do
      it "employeeが作成可能であること" do
        expect(employee.valid?).to eq true;
      end
    end

    subject { test_employee.valid? }
    let!(:test_employee) { employee }

    context "numberカラム" do
      it "空欄を防ぐこと" do
        test_employee.number = " "
        is_expected.to eq false;
      end
    end
    context "last_nameカラム" do
      it "空欄を防ぐこと" do
        test_employee.last_name = " "
        is_expected.to eq false;
      end
    end
    context "first_nameカラム" do
      it "空欄を防ぐこと" do
        test_employee.first_name = " "
        is_expected.to eq false;
      end
    end
    context "accountカラム" do
      it "空欄を防ぐこと" do
        test_employee.account = " "
        is_expected.to eq false;
      end
    end
    context "passwordカラム" do
      it "空欄を防ぐこと" do
        test_employee.password = " "
        is_expected.to eq false;
      end
    end
    context "emailカラム" do
      it "空欄を防ぐこと" do
        test_employee.email = " "
        is_expected.to eq false;
      end
    end
    context "date_of_joiningカラム" do
      it "空欄を防ぐこと" do
        test_employee.date_of_joining = " "
        is_expected.to eq false;
      end
      # it "文字列を防ぐこと" do
      #   test_employee.date_of_joining = "a" * 8
      #   is_expected.to eq false;
      # end
    end

    describe "numメソッドのテスト" do
      it "numがIntegerであること" do
        expect(employee.num.integer?).to eq true;
      end
    end
  end
end