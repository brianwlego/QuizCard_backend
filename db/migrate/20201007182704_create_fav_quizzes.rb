class CreateFavQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :fav_quizzes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
