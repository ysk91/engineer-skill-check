require 'rails_helper'

RSpec.describe "articlesコントローラのテスト" do
  let(:employee) { create(:employee) }
  let(:article) { create(:article, employee_id: employee.id) }

  describe "表示のテスト" do
    before do
      login(employee)
    end
    it "indexページを表示する" do
      pending "Webpackerがapplication.jsを参照できないエラー"
      get articles_path
      expect(responce).to be_successful
    end
    it "showページを表示する" do
      pending "Webpackerがapplication.jsを参照できないエラー"
      get article_path(article)
      expect(responce).to be_successful
    end
    it "newページを表示する" do
      pending "Webpackerがapplication.jsを参照できないエラー"
      get new_article_path
      expect(responce).to be_successful
    end
    it "editページを表示する" do
      pending "Webpackerがapplication.jsを参照できないエラー"
      get edit_article_path(article)
      expect(responce).to be_successful
    end
  end

  describe "CRUDのテスト" do
    describe "認証済のユーザー" do
      before do
        login(employee)
      end
      it "認証の確認" do
        expect(employee.news_posting_auth.nil?).to eq false;
      end
      it "createできる" do
        expect{
          post articles_path, params: { article: {
            title: "RSpec",
            content: "test"
          } }
          }.to change{ Article.count }.by(1)
      end
      it "updateできる" do
        patch article_path(article), params: { article: {
          content: "Updated content."
        } }
        expect(article.reload.content).to eq("Updated content.")
      end
      it "deleteできる" do
        delete article_path(article)
        expect(article.reload.deleted_at.is_a?(FalseClass)).to eq false;
      end
    end

    describe "未認証のユーザー" do
      before do
        login(employee)
        patch employee_path(employee), params: { employee: {
          news_posting_auth: false
        } }
      end
      it "認証の確認" do
        expect(employee.reload.news_posting_auth.is_a?(FalseClass)).to eq true;
      end
      it "createできない" do
        pending "新規作成ボタンが表示されないだけで、createできてしまう"
        expect{
          post articles_path, params: { article: {
            title: "RSpec",
            content: "test"
          } }
          }.to_not change{ Article.count }.by(1)
      end
      it "updateできない" do
        pending "編集ボタンが表示されないだけで、updateできてしまう"
        patch article_path(article), params: { article: {
          content: "Updated content."
        } }
        expect(article.reload.content).to_not eq("Updated content.")
      end
      it "deleteできない" do
        pending "削除ボタンが表示されないだけで、deleteできてしまう"
        delete article_path(article)
        expect(article.reload.deleted_at.is_a?(FalseClass)).to eq true;
      end
    end
  end

  describe "sort_columnのテスト" do

  end
end