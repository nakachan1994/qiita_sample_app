class HomesController < ApplicationController
  def top
    @posts = Post.includes(:user)
  end
end
