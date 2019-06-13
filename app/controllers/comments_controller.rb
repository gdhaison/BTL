class CommentsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :show]
  def create
    @comment = current_user.comment.build(comment_params)
    if @comment.save
    flash[:success] = "Comment created!"
    redirect_to root_url
    else
    @feed_items = []

  end
  end 
  private
  def comment_params
    params.require(:comment).permit(:laptop_id, :user_id, :content)
  end 
end
