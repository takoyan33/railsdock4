class CommentsController < ApplicationController
  def create
    #コメント作成
    @user = current_user
    comment = @user.comments.build(comment_params)
    #userの紐付けて投稿
    comment.name = @user.name
    if comment.save!
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.board
    else
      redirect_back(fallback_location: root_path)
      # , flash: {
      #   comment: comment,
      #   error_messages: comment.errors.full_messages
      # }
    end
  end

  def destroy
     #コメント削除
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash: {notice: 'コメントが削除されました'}
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment, :user_id)
  end
end
