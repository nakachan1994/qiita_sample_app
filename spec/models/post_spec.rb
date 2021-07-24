require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'モデルのテスト' do
    it "有効なpostの場合は保存されるか" do
      expect(build(:post)).to be_valid
    end

    context "空白のバリデーションチェック" do
      it "imegeが空白の場合にエラーメッセージが返ってくるか" do
        post = build(:post, image: nil)
        post.valid?
        expect(post.errors[:image]).to include("を入力してください")
      end
      it "contentが空白の場合にエラーメッセージが返ってくるか" do
        post = build(:post, content: nil)
        post.valid?
        expect(post.errors[:content]).to include("を入力してください")
      end
    end

    it "contentの文字数が141文字以上の場合エラーメッセージが返ってくるか" do
      post = create(:post)
      # Faker::Lorem.characters(number: 141)でランダムな文字列を141字で作成できる
      post.content = Faker::Lorem.characters(number: 141)
      post.valid?
      expect(post.errors[:content]).to include("は140文字以内で入力してください")
    end
  end
end
