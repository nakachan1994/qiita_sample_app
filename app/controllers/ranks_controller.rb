class RanksController < ApplicationController
  def rank
    # 投稿のいいね数ランキング
    @post_like_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    # 投稿のコメント数ランキング
    @post_comment_ranks = Post.find(Comment.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    # 自分の投稿のいいねランキング
    @my_post_like_ranks = current_user.posts.sort { |a, b| b.likes.count <=> a.likes.count }
    # ユーザーの投稿数ランキング
    @user_post_ranks = User.where(id: Post.group(:user_id).order('count(user_id) desc').pluck(:user_id))
    # ユーザーの全投稿に対するいいね数ランキング
    post_like_count = {}
    User.all.each do |user|
      post_like_count.store(user, Like.where(post_id: Post.where(user_id: user.id).pluck(:id)).count)
    end
    @user_post_like_ranks = post_like_count.sort_by { |_, v| v }.reverse.to_h.keys
    # 月間ランキング
    @month_user_post_ranks = User.where(id: Post.group(:user_id).where(created_at: Time.current.all_month).order('count(user_id) desc').pluck(:user_id))
    # 週間ランキング
    @week_post_like_ranks = Post.find(Like.group(:post_id).where(created_at: Time.current.all_week).order('count(post_id) desc').pluck(:post_id))
    # 日別ランキング
    @today_post_comment_ranks = Post.find(Comment.group(:post_id).where(created_at: Time.current.all_day).order('count(post_id) desc').pluck(:post_id))
  end
end
