class AddScoresToLineGraphs < ActiveRecord::Migration[5.2]
  def change
    add_column :line_graphs, :scores, :integer, array: true, default: []
    remove_column :line_graphs, :score1, :integer
    rename_column :line_graphs, :score2, :maximum
    remove_column :line_graphs, :score3, :integer
  end
end
