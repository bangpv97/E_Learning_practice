class CategoriesController < ActionController::Base
  before_action :logged_in_user, only: %i(only)
  def index
    @categories = Category.paginate(page: params[:page], per_page:8).has_word?
  end
end
