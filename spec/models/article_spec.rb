require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:article) { build(:article)}
  describe "バリデーションのテスト" do
    describe "正しい値" do
      it "articleが作成可能であること" do
        expect(article.valid?).to eq true;
      end
    end

    subject { test_article.valid? }
    let!(:test_article) { article }

    context "空欄を防ぐこと" do
      it "titleカラム" do
        test_article.title = " "
        is_expected.to eq false;
      end
      it "contentカラム" do
        test_article.content = " "
        is_expected.to eq false;
      end
    end

    context "文字数制限" do
      it "titleカラムが51文字以上を防ぐこと" do
        test_article.title = "a" * 51
        is_expected.to eq false;
      end
    end
  end

  describe "スコープのテスト" do
    let!(:article_1) { create(:article,
      deleted_at: nil # 明示的にnil
    )}
    let!(:article_2) { create(:article,
      deleted_at: nil # 明示的にnil
    )}
    let!(:article_3) { create(:article,
      deleted_at: "2020/12/10" # 削除された記事
    )}

    describe "activeスコープ" do
      it "activeで呼び出せること" do
          expect(Article.active).to include(article_1, article_2)
      end
      it "activeで呼び出さないこと" do
        expect(Article.active).to_not include(article_3)
      end
    end
  end
end