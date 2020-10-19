class CreateScore < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.belongs_to :quiz, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :percent
      t.string :right
      t.string :wrong

      t.timestamps
    end
  end
end
