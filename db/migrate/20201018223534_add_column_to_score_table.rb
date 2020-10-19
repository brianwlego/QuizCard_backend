class AddColumnToScoreTable < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :chosen, :string

    add_column :cards, :num, :integer
  end
end
