class QuizPresenter
  def initialize(quiz)
    @quiz = quiz
  end

  def created_at
    @quiz.created_at('Radīts šādā datumā: %m/%d/%Y')
  end
end