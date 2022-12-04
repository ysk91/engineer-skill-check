class RenameAutherColumnToArticle < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :auther, :employee_id
  end
end
