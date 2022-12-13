class ChangeNumberColumnToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :employees, :number, :integer
  end
end
