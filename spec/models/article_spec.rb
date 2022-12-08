require 'rails_helper'

RSpec.describe "Articleモデルのテスト" do
  describe "バリデーションのテスト" do
    let(:department) { FactoryBot.create(:department)}
    let(:office) { FactoryBot.create(:office)}
    let!(:employee) { FactoryBot.create(:employee, department_id: department.id, office_id: office.id)}
    let!(:article) { build(:article, employee_id: employee.id)}

    describe "正しい値" do
      it "articleが作成可能であること" do
        expect(article.valid?).to eq true;
      end
    end

    subject { test_article.valid? }
    let!(:test_article) { article }

    context "titleカラム" do
      it "空欄を防ぐこと" do
        test_article.title = " "
        is_expected.to eq false;
      end
      it "50文字以内であること" do
        test_article.title = "a" * 51
        is_expected.to eq false;
      end
    end

    context "contentカラム" do
      it "空欄を防ぐこと" do
        test_article.content = " "
        is_expected.to eq false;
      end
    end
  end
end