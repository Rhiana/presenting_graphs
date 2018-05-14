class CreateCircleGraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_graphs do |t|
      t.integer :score
      t.integer :total

      t.timestamps
    end
  end
end
