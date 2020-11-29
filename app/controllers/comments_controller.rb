class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    flash[:notice] = "Successfully #{@comment.author}'s comment is created..."
    redirect_to article_path(@comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
