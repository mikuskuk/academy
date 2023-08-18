class QuizzesController < ApplicationController
  before_action :load_quiz, except: [:index, :create, :new]

  def index
    # render json: Quiz.all
    @quizzes = Quiz.all
  end

  def show
    # render json: @quiz
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(quiz_params)
    if @quiz.persisted?
      redirect_to @quiz
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @quiz.destroy

    redirect_to quizzes_path
  end

  def questions
    render json: @quiz.questions
  end

  private

  def load_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description)
  end
end