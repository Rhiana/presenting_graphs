class CreateGaugeGraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :gauge_graphs do |t|
      t.integer :score
      t.integer :total

      t.timestamps
    end
  end
end
