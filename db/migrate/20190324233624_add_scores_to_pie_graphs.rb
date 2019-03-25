class AddScoresToPieGraphs < ActiveRecord::Migration[5.2]
  def change
    add_column :pie_graphs, :scores, :integer, array: true, default: []
    remove_column :pie_graphs, :score1, :integer
    remove_column :pie_graphs, :score2, :integer
    remove_column :pie_graphs, :score3, :integer
  end
end
