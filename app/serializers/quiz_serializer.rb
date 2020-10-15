class QuizSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :img_url, :questions, :created_at, :made_by

  def made_by
    user = User.find(object.user_created_id)
    return user.first_name + " " + user.last_name
  end

  def questions
    object.questions.map do |question| 
      {content: question.content,
        id: question.id,
        img_url: question.img_url,
        quiz_id: question.quiz_id,
        choices: question.choices.map do |choice|
          {content: choice.content,
            id: choice.id,
            img_url: choice.img_url,
            answer: choice.answer,
            question_id: choice.question_id
          }
        end
      }
    end
  end

end
