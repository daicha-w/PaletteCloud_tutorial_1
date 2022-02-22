class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, flash: { success: 'Post saved successfully.' }
    else
      render :new
      flash.now[:error] = 'Failed to save post.'
    end
  end

  def edit
  end

  def update
    if post.update(post_params)
      redirect_to posts_path, flash: { success: 'Post updated successfully.' }
    else
      render :edit
      flash.now[:error] = 'Failed to update post.'
    end
  end

  def destroy
    if post.destroy
      redirect_to posts_path, flash: { success: 'Post deleted successfully.' }
    else
      render :index
      flash.now[:error] = 'Failed to delete post.'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def post
      @post ||= ::Post.find(params[:id])
    end

    helper_method :post

end
