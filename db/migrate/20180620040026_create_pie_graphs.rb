class CreatePieGraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :pie_graphs do |t|
      t.integer :score1
      t.integer :score2
      t.integer :score3

      t.timestamps
    end
  end
end
