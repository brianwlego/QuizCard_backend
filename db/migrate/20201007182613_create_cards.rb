class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :front
      t.string :back
      t.integer :num
      t.string :img_url_front
      t.string :img_url_back
      t.belongs_to :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
