class ToppagesController < ApplicationController
  def index
    if logged_in?
      @posts = current_user.microposts.order(id: :desc).page(params[:page])
    end
  end
end
