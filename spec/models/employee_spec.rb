require 'rails_helper'

RSpec.describe Employee, type: :model do  
  let(:department) { FactoryBot.create(:department)}
  let(:office) { FactoryBot.create(:office)}
  let(:employee) { build(:employee, department_id: department.id, office_id: office.id)}

  describe "バリデーションのテスト" do
    describe "正しい値" do
      it "employeeが作成可能であること" do
        expect(employee.valid?).to eq true;
      end
    end

    subject { test_employee.valid? }
    let!(:test_employee) { employee }

    context "空欄を防ぐこと" do
      it "numberカラム" do
        test_employee.number = " "
        is_expected.to eq false;
      end
      it "last_nameカラム" do
        test_employee.last_name = " "
        is_expected.to eq false;
      end
      it "first_nameカラム" do
        test_employee.first_name = " "
        is_expected.to eq false;
      end
      it "accountカラム" do
        test_employee.account = " "
        is_expected.to eq false;
      end
      it "passwordカラム" do
        test_employee.password = " "
        is_expected.to eq false;
      end
      it "emailカラム" do
        test_employee.email = " "
        is_expected.to eq false;
      end
      it "date_of_joiningカラム" do
        test_employee.date_of_joining = " "
        is_expected.to eq false;
      end
    end

    context "指定した型であること" do
      it "numberがstring型であること" do
        expect(employee.number.is_a?(String)).to eq true;
      end
      it "date_of_joiningがdate型であること" do
        expect(employee.date_of_joining.is_a?(Date)).to eq true;
      end
      it "date_of_joiningに文字列を入れたらエラーを返すこと" do
        test_employee.date_of_joining = "a" * 8
        is_expected.to eq false;
      end
    end

    describe "一意性のテスト" do
      it "numberがユニークであること" do
        duplicate_employee = Employee.create(
          number: employee.number,
          last_name: "RSpec",
          first_name: "duplicate",
          account: "duplicate",
          password: "hogehoge",
          email: "duplicate@example.co.jp",
          date_of_joining: "2020/10/10"
        )
        expect(duplicate_employee.valid?).to eq false;
      end
      it "accountがユニークであること" do
        duplicate_employee = Employee.create(
          number: "D-001",
          last_name: "RSpec",
          first_name: "duplicate",
          account: employee.account,
          password: "hogehoge",
          email: "duplicate@example.co.jp",
          date_of_joining: "2020/10/10"
        )
        expect(duplicate_employee.valid?).to eq false;
      end
    end
  end

  describe "メソッドのテスト" do
    describe "numメソッド" do
      it "numがIntegerであること" do
        expect(employee.num.is_a?(Integer)).to eq true;
      end
    end
  end

  describe "スコープのテスト" do
    let!(:employee_1) { create(
      :employee,
      department_id: department.id,
      office_id: office.id,
      number: "A-001",
      account: "employee-1",
      deleted_at: nil # 明示的にnilにする
    ) }
    let!(:employee_2) { create(
      :employee,
      department_id: department.id,
      office_id: office.id,
      number: "A-002",
      account: "employee-2",
      deleted_at: nil # 明示的にnilにする
    ) }
    let!(:employee_3) { create(
      :employee,
      department_id: department.id,
      office_id: office.id,
      number: "DA-001",
      account: "employee-3",
      deleted_at: "2020/12/10" # 削除されたユーザー
    ) }
    it "employee_1~3がvalidであること" do
      expect(employee_1.valid? && employee_2.valid? && employee_3.valid?).to eq true;
    end
    describe "activeスコープ" do
      it "activeを呼び出すこと" do
        expect(Employee.active).to include(employee_1, employee_2)
      end
      it "activeで呼び出さないこと" do
        expect(Employee.active).to_not include(employee_3)
      end
    end
  end
end