class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    if @comment.save!
      ActionCable.server.broadcast 'comment_channel', content: @comment, nickname: @comment.user.nickname, time: @comment.created_at.strftime("%Y/%m/%d %H:%M")
    else
      render "items/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
