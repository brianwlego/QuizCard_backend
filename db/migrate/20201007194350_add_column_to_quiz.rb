class AddColumnToQuiz < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :user_created_id, :integer
    add_column :decks, :user_created_id, :integer
  end
end
