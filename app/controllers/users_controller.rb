class UsersController < ApplicationController
  before_action :search

  def show
    @user = User.find(params[:id])
  end

  def search
    # params[:q]のqには検索フォームに入力した値が入る
    @q = User.ransack(params[:q])
  end

  def index
    # distinct: trueは重複したデータを除外
   @users = @q.result(distinct: true)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
