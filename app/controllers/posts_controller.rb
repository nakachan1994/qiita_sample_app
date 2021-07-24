class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def index
    # new_pageに変更
    @new_posts = Post.page(params[:new_page]).per(3)
    @popular_posts = Post.find(Like.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
    # popular_pageに変更
    @popular_posts = Kaminari.paginate_array(@popular_posts).page(params[:popular_page]).per(3)
    @pick_up_posts = Post.find(Like.group(:post_id).where(created_at: Time.current.all_week).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
    # pick_up_pageに変更
    @pick_up_posts = Kaminari.paginate_array(@pick_up_posts).page(params[:pick_up_page]).per(3)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, alert: '投稿を削除しました'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿を編集しました'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :content)
  end

end
