class LessonsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create]
  def show
    @lesson = Lesson.find_by id: params[:id]
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    @lesson = current_user.lessons.create(category_id: @category.id)
    redirect_to new_lesson_result_url(@lesson)
  end
end
