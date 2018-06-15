class CreateLineGraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :line_graphs do |t|
      t.integer :score1
      t.integer :score2
      t.integer :score3

      t.timestamps
    end
  end
end
