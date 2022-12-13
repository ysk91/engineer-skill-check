require 'rails_helper'

RSpec.describe "Articlesのシステムテスト" do
  let(:employee) { create(:employee) }

  # scenario "ログインしてarticleを作成する" do
  #   pending "bootsnapが読み込めないエラー"
  #   visit login_path
  #   fill_in "employees[account]", with employee.account
  #   fill_in "employees[password]", with employee.password
  #   click_button "commit"
  #   visit articles_path

  #   expect{
  #     click_button "新規追加"
  #     fill_in "article[title]", with "Test title"
  #     fill_in "article[content]", with "Test content"
  #     click_button "commit"

  #     expect(page).to have_content "記事「Test title」を登録しました。"
  #     expect(page).to have_content "Test title"
  #     expect(page).to have_content "Test content"
  #   }.to change{employee.articles.count}.by(1)
  # end

end
