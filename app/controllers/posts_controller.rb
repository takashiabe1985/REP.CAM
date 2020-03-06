class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update, :edit]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def new
    @post = Post.new
  end  
  
  def create
    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to root_url
  end
  
  def show
  end
  
  def edit
  end
  
  def update

    if @post.update(post_params)
      flash[:success] = '投稿を編集しました'
      redirect_to @post
    else
      flash.now[:danger] = '正しく編集されませんでした'
      render :edit
    end
  end
  private

  def post_params
    params.require(:post).permit(:content, :title, :image)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end  
