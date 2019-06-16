class ResultsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update]

  def new
    @lesson = Lesson.find_by_id(params[:lesson_id])
    @specific_word = (@lesson.category.words - @lesson.words).try(:first)

    if @specific_word.blank?
      @score = @lesson.get_correct.count
      redirect_to lesson_path(@lesson)
    else
      @result = @lesson.results.build(word: @specific_word)
    end
  end

  def create
    @lesson = Lesson.find_by_id(params[:lesson_id])
    if @lesson.results.create(result_params)
      redirect_to new_lesson_result_path(@lesson)
    end
  end

  def update
    if @lesson.results.size - 1
      redirect_to [@lesson, @lesson.results[@lesson.results.index(result) + 1]]
    else
      @score = @lesson.get_correct.count
    end
  end

  private

  def result_params
    params.require(:result).permit(:word_id, :answer_id)
  end
end
