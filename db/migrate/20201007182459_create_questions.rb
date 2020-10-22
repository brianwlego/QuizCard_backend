class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :content
      t.string :img_url
      t.integer :num
      t.belongs_to :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
