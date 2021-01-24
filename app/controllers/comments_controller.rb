class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment=Comment.create(comment_params)
    redirect_to "/items/#{@comment.item.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
