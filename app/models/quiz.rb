class Quiz < ApplicationRecord

  has_many :questions, dependent: :delete_all
  has_many :fav_quizzes, dependent: :delete_all
  has_many :users, through: :fav_quizzes
  has_many :scores, dependent: :delete_all

  def save_image(image, quiz)
    name = File.basename(image)
    obj = S3_BUCKET.object(name)
    obj.upload_file(image)
    quiz.img_url = obj.public_url.to_s
    quiz.save
  end

end
