class WordsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  def index
    @answers = current_user.group_answer(params).paginate(page: params[:page], per_page: 10)
  end
end
