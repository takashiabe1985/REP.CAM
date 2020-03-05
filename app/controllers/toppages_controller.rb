class ToppagesController < ApplicationController
  def index
      @posts = Post.all.order(id: :desc).page(params[:page])
  end
end
