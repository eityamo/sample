class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to @board, notice: '作成！'
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: '更新！'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_url, notice: '削除！'
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title,:body)
  end
end
