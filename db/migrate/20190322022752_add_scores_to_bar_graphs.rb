class AddScoresToBarGraphs < ActiveRecord::Migration[5.2]
  def change
    add_column :bar_graphs, :scores, :integer, array: true, default: []
    remove_column :bar_graphs, :score1, :integer
    rename_column :bar_graphs, :score2, :maximum
  end
end
