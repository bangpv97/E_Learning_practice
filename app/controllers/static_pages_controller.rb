class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @feed_items = current_user.feed.paginate page: params[:page], per_page: Settings.per_page
  end

  def about; end
end
