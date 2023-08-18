# == Schema Information
#
# Table name: quizzes
#
#  id           :integer          not null, primary key
#  description  :string
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  questions_id :integer
#
# Indexes
#
#  index_quizzes_on_questions_id  (questions_id)
#  index_quizzes_on_title         (title) UNIQUE
#
class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
end
