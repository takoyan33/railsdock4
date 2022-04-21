class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all.order(id: "DESC") 
    @boards = @boards.page(params[:page])
    @boards_count = Board.all.count
    @today_count = Board.created_today.count
    @lastmonth_count = Board.created_last_month.count
    @month_count = Board.created_month.count
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    @user = current_user
    # board = Board.new(board_params)
    board = @user.boards.build(board_params)
    board.image.attach(params[:board][:image])
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      redirect_back fallback_location: root_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(board_id: @board.id)
    @user = User.find(@board.user_id)
    @like = Like.new
  end

  def edit
    @board.attributes = flash[:board] if flash[:board]
  end

  def update
    if @board.update(board_params)
      redirect_to @board
    else
      redirect_back fallback_location: root_path , flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" }
  end

  private

  def board_params
    params.require(:board).permit(:content, :image, :name, :title, :body, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
end