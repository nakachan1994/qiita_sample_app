require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'モデルのテスト' do
    it "有効なcommentの場合は保存されるか" do
      expect(build(:comment)).to be_valid
    end

    it "commentが空白の場合にエラーメッセージが返ってくるか" do
      # commentモデルのcommentカラムです。ややこしくてすいません
      comment = build(:comment, comment: nil)
      comment.valid?
      expect(comment.errors[:comment]).to include("を入力してください")
    end

    it "commentの文字数が50文字以上の場合エラーメッセージが返ってくるか" do
      comment = build(:comment)
      comment.comment = Faker::Lorem.characters(number: 51)
      comment.valid?
      expect(comment.errors[:comment]).to include("は50文字以内で入力してください")
    end
  end
end
