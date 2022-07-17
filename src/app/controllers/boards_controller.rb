class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]
  #このアクションのみ

  def index
    #タグ検索
    @q = Board.ransack(params[:q])
    if params[:tag_id].present?
    #タグ検索の処理
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @boards = @boards.page(params[:page]).per(8)
    else
    #キーワード検索
    @boards = @q.result(distinct: true).page(params[:page]).per(8)
    .all.order(id: "DESC")
    end

    @boards_count = Board.all.count 
    #掲示板の合計数
    @today_count = Board.created_today.count
    #今日投稿された掲示板の数
    @lastmonth_count = Board.created_last_month.coun
    #先月投稿された掲示板の数
    @month_count = Board.created_month.count 
    #今月投稿された掲示板の数
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    @user = current_user
    # board = Board.new(board_params)
    board = @user.boards.build(board_params)
    #userを紐付け
    board.image.attach(params[:board][:image])
    #画像投稿処理
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