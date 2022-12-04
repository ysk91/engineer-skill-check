class ChangeCulumnNameDaleteAtForArticle < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :dalete_at, :deleted_at
  end
end
