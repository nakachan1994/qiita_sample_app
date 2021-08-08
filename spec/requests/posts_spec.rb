require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # FactoryBotのテストデータを使ってuserとpostのデータを
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }

  describe 'GET /new' do
    it 'returns http success' do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      sign_in user
      get post_path(post)
      expect(response).to have_http_status(:success)
    end
  end
end
