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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を変更しました'
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
