class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bar_graphs, :score, :score1
    rename_column :bar_graphs, :total, :score2
  end
end
