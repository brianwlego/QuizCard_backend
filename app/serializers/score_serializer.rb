class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :quiz_id, :percent, :date, :right, :wrong, :user_name, :created_at, :chosen, :quiz_title

  def right
    object.right.split(',').map{|num| num.to_i}
  end

  def wrong
    object.wrong.split(',').map{|num| num.to_i}
  end

  def chosen
    object.chosen.split(',').map{|num| num.to_i}
  end

  def user_name
    return object.user.first_name + ' ' + object.user.last_name
  end

  def quiz_title
    return object.quiz.title
  end

  def date
    return object.created_at.strftime("%B #{object.created_at.day.ordinalize}, %Y")
  end
end