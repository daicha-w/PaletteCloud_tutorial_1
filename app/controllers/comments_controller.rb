class CommentsController < ApplicationController

  def create
    if post.comments.create(comments_params)
      redirect_to post_path(post)
      flash[:success] = 'Comment saved successfully.'
    else
      render :show
      flash.now[:error] = 'Failed to save comment.'
    end
  end

  def destroy
    if comment.destroy
      redirect_to post_path(post), flash: { success: 'Comment deleted successfully.' }
    else
      render :show
      flash.now[:error] = 'Failed to delete comment.'
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:body)
    end

    def post
      @post ||= Post.find(params[:post_id])
    end

    def comment
      @comment ||= post.comments.find(params[:id])
    end

end
