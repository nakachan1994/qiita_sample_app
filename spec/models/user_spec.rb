require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'モデルのテスト' do
    it '有効なuserの場合は保存されるか' do
      # FactoryBotで作ったデータが有効であるか確認しています
      expect(build(:user)).to be_valid
    end

    context '空白のバリデーションチェック' do
      it 'nameが空白の場合にエラーメッセージが返ってくるか' do
        # userにnameカラムを空で保存したものを代入
        user = build(:user, name: nil)
        # バリデーションチェックを行う
        user.valid?
        # nameカラムでエラーが出て、エラーメッセージに"を入力してください"が含まれているか？
        expect(user.errors[:name]).to include('を入力してください')
      end
      it 'emailが空白の場合にエラーメッセージが返ってくるか' do
        # emailのバリデーションチェック
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end
      it 'passwordが空白の場合にエラーメッセージが返ってくるか' do
        # passwordのバリデーションチェック
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end
    end

    it 'nameの文字数が11文字以上の場合エラーメッセージが返ってくるか' do
      # nameカラムに"hogehogehoge"(11文字以上)の文字列を入れる
      user = build(:user, name: 'hogehogehoge')
      user.valid?
      expect(user.errors[:name]).to include('は10文字以内で入力してください')
    end

    context '一意性制約の確認' do
      # itの前に@userにbuild(:user)を代入
      before do
        @user = build(:user)
      end

      it '同じnameの場合エラーメッセージが返ってくるか' do
        # @userを保存
        @user.save
        # another_userにbuild(:user)を保存
        another_user = build(:user)
        # another_userのnameカラムに@userと同じnameを代入
        another_user.name = @user.name
        # @userと同じnameになるので、バリデーションチェックに引っかかる
        another_user.valid?
        expect(another_user.errors[:name]).to include('はすでに存在します')
      end
      it '同じemailの場合エラーメッセージが返ってくるか' do
        # emailバージョン
        @user.save
        another_user = build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors[:email]).to include('はすでに存在します')
      end
    end
  end
end
