class Question < ApplicationRecord

  belongs_to :quiz
  has_many :choices, dependent: :delete_all

  accepts_nested_attributes_for :choices, allow_destroy: true, update_only: true



end
